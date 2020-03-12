export class User {
  constructor(
    private status: boolean,
    private nom: string,
    private prenom: string,
    private fonction: string,
    private tockenMobility?: string,
    private existe?: boolean
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

  setTocken(tocken) {
    this.tockenMobility = tocken;
  }

  setExiste(existe) {
    this.existe = existe;
  }

  // getters
  getNom() {
    return this.nom;
  }

  getExiste() {
    return this.existe;
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
