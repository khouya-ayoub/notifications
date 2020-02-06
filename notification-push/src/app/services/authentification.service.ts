import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Md5 } from 'ts-md5';
import {User} from '../models/user.model';

const serveurUrl = 'http://127.0.0.1:80/AJAX/server/sv.php';

@Injectable()
export class AuthentificationService {
  private option = {
    responseType: 'text'
  };


  constructor(private serveur: HttpClient) {
  }

  // Status d'un utilisateur pardéfaut  non authentifié
  private isAuth = false;
  private user: User;

  // connexion d'un utilisateur
  signInUser(login: string, pass: string) {
    return new Promise(
      (resolve, reject) => {
        this._getUser(login, pass).subscribe(
          (result) => {
            if (result.autorisation) {
              this.isAuth = result.autorisation;
              this.user = new User(this.isAuth, result.MUS_NOM, result.MUS_PRENOM, result.MUS_FONCTION);
            } else {
              this.isAuth = result.autorisation;
            }
            resolve(this.isAuth);
          },
          (err) => {
            console.log(err.message);
            reject();
          }
        );
      }
    );
  }

  sinOutUser() {
    this.isAuth = false;
    this.user = null;
  }

  getAuthentification() {
    return this.isAuth;
  }

  // test envoie au serveur

  private _getUser(userLogin: string, userPass: string): Observable<any> {
    return this.serveur.post<any>(serveurUrl, {
      functionToExecute: 'signInUser',
      _login: userLogin,
      _password: Md5.hashStr(userPass)
    }, {
      responseType: 'json'
    });
  }

  getUser() {
    return this.user;
  }

}
