export class AuthentificationService {

  // Status d'un utilisateur pardéfaut  non authentifié
  private isAuth = false;

  // connexion d'un utilisateur
  signInUser() {
    return new Promise(
      (resolve, reject) => {
        setTimeout(
          () => {
            this.isAuth = true;
            resolve(true);
          }, 2000
        );
      }
    );
  }

  sinOutUser() {
    this.isAuth = false;
  }

  getAuthentification() {
    return this.isAuth;
  }

}
