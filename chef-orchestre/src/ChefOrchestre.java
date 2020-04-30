
public class ChefOrchestre {

    public static void main(String[] args) {


        ThreadConsulation threadConsulation = new ThreadConsulation();
        threadConsulation.start();

        ThreadNotifierServeur threadNotifierServeur = new ThreadNotifierServeur();
        threadNotifierServeur.start();

        /*
        * Cette section est utilisé pour écouter tous les changements effectués dans la base de données
        * Insertion, Modification, et suppression
        *
        * ThreadEcouteDataBase threadEcouteDataBase = new ThreadEcouteDataBase();
        * threadEcouteDataBase.start();
        * new InitialisationSystem().start();
        */

    }
}
