package fr.nacvolley.tournament.util;

import fr.nacvolley.tournament.model.Team;

/**
 * Created by faure on 01/05/14.
 */
public class Randomizer {

    public static String teamNames[] = {"Les aigles", "Les alligators", "Les anguilles", "Les anchois", "Les appollons",
            "Les baleines", "Les blackbass", "Les bourdons", "Les buses", "Les caimans", "Les castors", "Les cobras",
            "Les cochons", "Les coqs", "Les couleuvres", "Les crapauds", "Les crevettes", "Les crotales", "Les dingos",
            "Les dragons", "Les écrevisses", "Les écureuils", "Les éléphants", "Les escargots", "Les fouines", "Les fourmis",
            "Les gerbilles", "Les gibbons", "Les gorilles", "Les grenouilles", "Les grizzlis", "Les guépards",
            "Les hamsters", "Les harpies", "Les hérons", "Les hyènes", "Les iguanes", "Les jaguars", "Les krills",
            "Les lapins", "Les lamas", "Les lézards", "Les limaces", "Les lions", "Les loups", "Les loutres", "Les lynx",
            "Les macaques", "Les manchots", "Les marabouts", "Les méduses", "Les mouches", "Les mouflons", "Les moustiques",
            "Les mulots", "Les nasiques", "Les okapis", "Les orques", "Les otaries", "Les ours", "Les panthères", "Les pélicans",
            "Les perruches", "Les phoques", "Les poissons", "Les pumas", "Les putois", "Les pythons", "Les ragondis",
            "Les rats", "Les renards", "Les requins", "Les rhinocéros", "Les roussettes", "Les salamandres", "Les saumons",
            "Les scorpions", "Les singes", "Les suricates", "Les tapirs", "Les taupes", "Les tigres", "Les tortues",
            "Les urubus", "Les varans", "Les vers", "Les wallaby", "Les yacks", "Les zèbres"};

    public static String teamAdjectives[] = {"rigolos", "souriants", "râleurs", "admirables",
            "aimables", "bavarois", "nantais", "bouleversants", "charmants", "communs", "majestueux", "magnifiques",
            "médiocres", "mignons", "passionnants", "placides", "coquets", "cyniques", "dégueux", "disjonctés",
            "doués", "éblouissants", "efficaces", "drôles", "émouvants", "épatants", "exaltants", "prodigieux",
            "renversants", "sublimes", "sulfureux", "superbes", "exceptionnels", "exemplaires", "festifs",
            "flamboyants", "formidables", "grandioses", "hardis", "horribles", "inconnus", "innomables", "infernaux",
            "insupportables", "intenables", "irrésistibles", "talentueux", "tragiques", "trépidants", "valeureux", "vitaminés",
            "vulgaires"};
    public static String names[] = {
            "Emmanuel", "Vincent", "Thomas", "Patrick", "Virgile", "Nicolas", "Franck", "Félicien",
            "Mathieu", "Jacky", "Maggy", "Stéphanie", "Aurélie", "Alan", "Valérie", "Sophie", "Maggy",
            "François", "Thibault", "Ludovic", "Jean-Charles", "Christophe", "Julien", "Rémi",
            "Carine", "Elise", "Erwan", "Florent", "Karen", "Emilie"
    };

    public static String randomTeamName() {
        int rndNameIndex = (int) (Math.random() * teamNames.length);
        int rndAdjIndex = (int) (Math.random() * teamAdjectives.length);
        return teamNames[rndNameIndex] + " " + teamAdjectives[rndAdjIndex];
    }

    public static String randomName() {
        int rndNameIndex = (int) (Math.random() * names.length);
        return names[rndNameIndex];
    }

    public static Team createRandomTeam() {
        Team team = new Team();
        team.setName(randomTeamName());
        team.setLevel((int) (Math.random() * 10));
        team.setCaptainName(randomName());
        team.setPlayersNames(randomName() + " " + randomName() + " " + randomName());
        team.setPhone("06.12.34.56.78");
        team.setClub("Club " + randomTeamName());
        team.setPhoto("default.png");
        return team;
    }


}
