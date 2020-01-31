export class AuthentificationService {

  // Status d'un utilisateur pardéfaut  non authentifié
  private isAuth = false;

  // connexion d'un utilisateur
  signInUser(login: string, pass: string) {
    return new Promise(
      (resolve, reject) => {
        setTimeout(
          () => {
            if (login === 'ayoub' && pass === '159') {
              this.isAuth = true;
            } else {
              this.isAuth = false;
            }
            resolve(this.isAuth);
          }, 10
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
