import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Md5 } from 'ts-md5';
import {User} from '../models/user.model';
import {CookieService} from 'ngx-cookie-service';

const serveurUrl = 'http://127.0.0.1:80/AJAX/server/sv.php';

@Injectable()
export class AuthentificationService {
  private option = {
    responseType: 'text'
  };


  constructor(private serveur: HttpClient, private cookieService: CookieService) {
  }

  // Status d'un utilisateur par défaut  non authentifié
  private isAuth = false;
  private user: User;
  private userCookies: any;

  // connexion d'un utilisateur
  signInUser(login: string, pass: string) {
    return new Promise(
      (resolve, reject) => {
        this._getUser(login, pass).subscribe(
          (result) => {
            if (result.autorisation) {
              this.isAuth = result.autorisation;
              this.user = new User(this.isAuth, result.MUS_NOM, result.MUS_PRENOM, result.MUS_FONCTION);
              // check if the display is already know
              if (this.cookieService.check('mobility-cookies')) {
                this.userCookies = JSON.parse(this.cookieService.get('mobility-cookies'));
                console.log(this.userCookies.mobilityTocken);
                this.user.setExiste(true);
              } else {
                this.userCookies = {
                  mobilityTocken : 'TockenTockenTockenTockenTockenTocken',
                  dispalyId : 1
                };
                this.cookieService.set('mobility-cookies', JSON.stringify(this.userCookies), 50, './', 'mobility-push', true, 'Lax');
                this.user.setExiste(false);
                console.log('Création de cookies');
              }
            } else {
              this.isAuth = result.autorisation;
            }
            resolve(this.isAuth);
          },
          (err) => {
            console.log(err.message);
            reject('Erreur de connexion serveur !');
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
      _password: userPass
    }, {
      responseType: 'json'
    });
  }

  getUser() {
    return this.user;
  }

}
