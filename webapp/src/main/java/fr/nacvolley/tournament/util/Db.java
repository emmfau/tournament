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

    public static final String DB_URL = "remote:localhost/tournament";
    public static final String DB_LOGIN = "admin";
    public static final String DB_PASSWORD = "admin";

    private static Db instance;

    /**
     * class registration is needed only the first time, so you could register all needed domains in your application startup.
     * Until orient server is up this registration will remain valid.
     */
    private Db() {
        // 1. Register POJO
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
