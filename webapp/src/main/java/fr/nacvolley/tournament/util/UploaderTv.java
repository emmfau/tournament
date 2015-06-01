package fr.nacvolley.tournament.util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.Iterator;
import java.util.List;

/**
 * Servlet implementation class UploadServlet (for TV screens)
 */
public class UploaderTv extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "uploads";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 5;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 5;

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
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    // Normalization (accents, .. )
                    String normalizedFileName = Normalizer.normalize(fileName, Normalizer.Form.NFD).replaceAll("[\u0300-\u036F]", "");
                    String filePath = uploadFolder + File.separator + normalizedFileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    // put ref in request for get in next jsp
                    request.setAttribute("photo", normalizedFileName);

                    // saves the file to upload directory
                    item.write(uploadedFile);

                    // create a thumbnail
                    try {
                        BufferedImage img = ImageIO.read(uploadedFile);
                        BufferedImage thumbnail = Scalr.resize(img, 200);
                        String thumbnailPath = uploadFolder + File.separator + normalizedFileName + "-thumb.jpg";
                        File thumbnailFile = new File(thumbnailPath);
                        ImageIO.write(thumbnail, "jpg", thumbnailFile);
                    } catch (Exception e) {
                        System.err.println("Error in creating thumbnail : " + e.getMessage());
                    }

                } else {
                    if (item.getFieldName().equals("screenId")) {
                        // extract and repush id in request Attr
                        request.setAttribute("theScreenId", item.getString());
                    }
                }
            }


            // displays done.jsp page after upload finished
            getServletContext().getRequestDispatcher("/tvScreenPhotoUploadAction.jsp").forward(
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
