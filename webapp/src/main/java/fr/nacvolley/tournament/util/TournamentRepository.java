package fr.nacvolley.tournament.util;

import fr.nacvolley.tournament.model.Tournament;
import org.ektorp.CouchDbConnector;
import org.ektorp.ViewQuery;
import org.ektorp.support.CouchDbRepositorySupport;
import org.ektorp.support.GenerateView;

import java.util.List;

/**
 * Created by emmfau on 19/03/16.
 * TODO : handle ConnectException : try other databases connected
 */
public class TournamentRepository extends CouchDbRepositorySupport<Tournament> {

    public static TournamentRepository instance = new TournamentRepository(Db.instance.db);

    public TournamentRepository(CouchDbConnector db) {
        super(Tournament.class,db);
        initStandardDesignDocument();
    }

    @GenerateView
    @Override
    public List<Tournament> getAll() {
        ViewQuery q = createQuery("all")
                .descending(true)
                .includeDocs(true);
        return db.queryView(q, Tournament.class);
    }

}
