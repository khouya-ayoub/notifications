export class User {
  constructor(
    private status: boolean,
    private nom: string,
    private prenom: string,
    private fonction: string
  ) {

  }

  // setters
  setNom(nom) {
    this.nom = nom;
  }

  setPrenom(prenom) {
    this.prenom = prenom;
  }

  setFonction(fonction) {
    this.fonction = fonction;
  }

  setStatus(status) {
    this.status = status;
  }

  // getters
  getNom() {
    return this.nom;
  }

  getPrenom() {
    return this.prenom;
  }

  getFonction() {
    return this.fonction;
  }

  getStatus() {
    return this.status;
  }

}
