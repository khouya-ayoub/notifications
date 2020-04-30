import {HttpClient} from '@angular/common/http';
import {Injectable} from '@angular/core';
import {BehaviorSubject} from 'rxjs';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {

  private serverUrl = 'http://localhost:3000/api/auth/signin';
  private isAuth$ = new BehaviorSubject<boolean>(false);
  private tocken: string;
  private userId: number;
  private useerName: string;
  private userEtatSub: number;

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
            (authData: { tocken: string, _userId: number, userName: string, userEtatSub: number}) => {
              this.tocken = authData.tocken;
              this.userId = authData._userId;
              this.useerName = authData.userName;
              this.userEtatSub = authData.userEtatSub;
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
    this.useerName = null;
    this.tocken = null;
  }

  getUserName() {
    return this.useerName;
  }

  getUserId() {
    return this.userId;
  }
  singup() {}

  getAuthStatus() {
    return this.isAuth$.getValue();
  }

  getUserEtatSub() {
    return (this.userEtatSub === 1);
  }

}
