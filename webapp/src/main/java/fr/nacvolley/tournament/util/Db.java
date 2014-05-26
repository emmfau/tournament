package fr.nacvolley.tournament.util;

import com.orientechnologies.orient.object.db.OObjectDatabasePool;
import com.orientechnologies.orient.object.db.OObjectDatabaseTx;
import fr.nacvolley.tournament.model.Tournament;


/**
 * https://github.com/orientechnologies/orientdb/wiki/Document-Database
 * If tomcat issue, may need to use OGlobalConfiguration.STORAGE_KEEP_OPEN.setValue( false );
 * Indexes : https://groups.google.com/forum/#!msg/orient-database/_uZXlWqBnLY/PWECusGm96UJ
 */
public class Db {

    public static final String DB_NAME = "tournament";
    public static final String DB_LOGIN = "admin";
    public static final String DB_PASSWORD = "admin";
    public static final String ENV_VARIABLE_DB_URL = "TOURDATA_PORT_2424_TCP_ADDR";
    public static String DB_URL = "remote:localhost/tournament"; // by default
    private static Db instance;

    /**
     * class registration is needed only the first time, so you could register all needed domains in your application startup.
     * Until orient server is up this registration will remain valid.
     */
    private Db() {
        String hostname = "localhost"; // By default
        // 1. Register POJO
        // Check environnement variable existence
        if (System.getenv(ENV_VARIABLE_DB_URL) != null && !System.getenv(ENV_VARIABLE_DB_URL).equals("")) {
            hostname = System.getenv(ENV_VARIABLE_DB_URL);
            DB_URL = "remote:" + hostname + "/" + DB_NAME;
        }
        System.out.println("Using DB_URL : " + DB_URL);

        OObjectDatabaseTx db = OObjectDatabasePool.global().acquire(DB_URL, DB_LOGIN, DB_PASSWORD);
        db.getEntityManager().registerEntityClasses(Tournament.class.getPackage().getName());
        db.close();

    }

    public static Db instance() {
        if (instance == null) {
            instance = new Db();
        }
        return instance;
    }

    public OObjectDatabaseTx get() {
        return OObjectDatabasePool.global().acquire(DB_URL, DB_LOGIN, DB_PASSWORD);
    }

}
