import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {BehaviorSubject} from 'rxjs';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {

  private serverUrl = 'http://localhost:3000/api/auth/signin';
  private isAuth$ = new BehaviorSubject<boolean>(false);
  private tocken: string;
  private userId: string;

  constructor(
    private serveur: HttpClient
  ) {}

  login(login: string, password: string) {
    return new Promise(
      (resolve, reject) => {
        this.serveur.post(this.serverUrl,
          { email: login, motdepass: password },
          { responseType: 'json' })
          .subscribe(
            (authData: { tocken: string, userId: string }) => {
              this.tocken = authData.tocken;
              this.userId = authData.userId;
              this.isAuth$.next(true);
              resolve();
            },
            (error) => {
              reject(error);
          }
        );
      }
    );
  }

  logout() {
    this.isAuth$.next(false);
    this.userId = null;
    this.tocken = null;
  }

  singup() {}

  getAuthStatus() {
    return this.isAuth$.getValue();
  }

}
