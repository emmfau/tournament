package fr.nacvolley.tournament.util;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.ektorp.AttachmentInputStream;
import org.imgscalr.Scalr;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLConnection;
import java.text.Normalizer;
import java.util.UUID;
import java.util.logging.Logger;

/**
 * Servlet implementation class UploadServlet
 */
public class Uploader extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "uploads";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 5;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 5;

    private Logger log = Logger.getLogger(Uploader.class.getName());


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            FileItemIterator iterator = upload.getItemIterator(request);
            while (iterator.hasNext()) {
                FileItemStream item = iterator.next();

                if (!item.isFormField()) {
                    log.warning("Got an uploaded file: " + item.getFieldName() + ", name = " + item.getName());
                    InputStream stream = item.openStream();
                    String contentType= URLConnection.guessContentTypeFromStream(stream);
                    byte[] data = IOUtils.toByteArray(stream);
                    InputStream myInputStream = new ByteArrayInputStream(data);
                    String uuid=UUID.randomUUID().toString();
                    String fileName = item.getName();
                    // Normalization (accents, .. )
                    String normalizedFileName = Normalizer.normalize(fileName, Normalizer.Form.NFD).replaceAll("[\u0300-\u036F]", "");

                    AttachmentInputStream a = new AttachmentInputStream(normalizedFileName, myInputStream, item.getContentType());
                    Db.instance.db.createAttachment(uuid, a);
                    request.setAttribute("attachmentId", uuid);
                    request.setAttribute("attachmentName", normalizedFileName);

                    // create a thumbnail
                    try {

                        AttachmentInputStream ais = Db.instance.db.getAttachment(uuid, normalizedFileName);

                        BufferedImage img = ImageIO.read(ais);
                        BufferedImage thumbnail = Scalr.resize(img, 200);
                        String tmpFolder=UUID.randomUUID().toString();
                        String thumbnailFolderPath = System.getProperty("java.io.tmpdir") + File.separator + "uploads" + File.separator + tmpFolder;
                        String thumbnailFile = thumbnailFolderPath + File.separator + normalizedFileName + "-thumb.jpg";
                        (new File(thumbnailFolderPath)).mkdirs();
                        ImageIO.write(thumbnail, "jpg", new File(thumbnailFile));
                        AttachmentInputStream athumb = new AttachmentInputStream(normalizedFileName+ "-thumb.jpg", new FileInputStream(thumbnailFile), item.getContentType());
                        String rev=Db.instance.db.getCurrentRevision(uuid);
                        Db.instance.db.createAttachment(uuid, rev, athumb);

                        // Then remove thumbnail
                        FileUtils.deleteDirectory(new File(thumbnailFolderPath));

                    } catch (Exception e) {
                        System.err.println("Error in creating thumbnail : " + e.getMessage());
                    }

                }
                else {
                    String name = item.getFieldName();
                    InputStream stream = item.openStream();
                    byte[] buffer = new byte[ 128 ];
                    int len = stream.read( buffer );
                    String value = new String( buffer, 0,len );
                    if ( name.equals( "teamId" ) ) {
                        request.setAttribute("teamId", value);
                    }
                }

            }

            // displays done.jsp page after upload finished
            getServletContext().getRequestDispatcher("/photoUploadAction.jsp").forward(
                    request, response);

        } catch (FileUploadException ex) {
            System.err.println("FileUploadException in uploading : " + ex.getMessage());

            throw new ServletException(ex);
        } catch (Exception ex) {
            System.err.println("Exception in uploading : " + ex.getMessage());

            throw new ServletException(ex);
        }

    }

}
