package fr.nacvolley.tournament.util;

import org.ektorp.CouchDbConnector;
import org.ektorp.CouchDbInstance;
import org.ektorp.http.HttpClient;
import org.ektorp.http.StdHttpClient;
import org.ektorp.impl.StdCouchDbConnector;
import org.ektorp.impl.StdCouchDbInstance;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.logging.Logger;


/**
 * Using CouchDb database
 */
public class Db {

    public static Db instance=new Db();

    public CouchDbConnector db;

    private Logger log = Logger.getLogger(Db.class.getName());

    private String dbUrl;

    private String dbName;
    public Db() {
        // 1. Register POJO
        try {
            InitialContext initCtx = new InitialContext();
            Context envCtx = (Context)initCtx.lookup("java:comp/env");
            dbUrl=(String)envCtx.lookup("dbUrl");
            dbName=(String)envCtx.lookup("dbName");
        }
        catch (Exception e) {
            this.log.severe("Cannot get context environment variables (dbName, dbUrl), check context XML file : " + e.getMessage());
            dbUrl="http://localhost:2001";
            dbName="tournament";
            this.log.warning("Using default dbUrl : "+dbUrl+", with default dbName : "+dbName);
        }

        try {
            HttpClient httpClient = new StdHttpClient.Builder()
                    .url(dbUrl)
                    .build();

            CouchDbInstance dbInstance = new StdCouchDbInstance(httpClient);
            db = new StdCouchDbConnector(dbName, dbInstance);
            db.createDatabaseIfNotExists();
        }
        catch (Exception e) {
            System.err.println("Error when opening DB : "+e.getMessage());
        }
    }

}
