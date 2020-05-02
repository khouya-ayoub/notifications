/* *
 * @author
 * @description File for the Notification service tslint:disable-next-line:jsdoc-format
 * */

import {Injectable} from '@angular/core';
import {AuthService} from './auth.service';
import {HttpClient} from "@angular/common/http";
import {rejects} from "assert";

@Injectable()
export class NotificationService {

  private serverUrl = 'http://localhost:3000/api/db/modif-state-sub';
  private serverUrlAddNotif = 'http://localhost:3000/api/db/add-notification';
  private serverUrlAddUser = 'http://localhost:3000/api/db/add-user';
  private serverUrlGetNotifications = 'http://localhost:3000/api/db/get-notifications';

  constructor(
    private auth: AuthService,
    private serveur: HttpClient
  ) {
  }

  subscribeServiceWorker(publicKey) {
    // check for the service worker if it's supported by the browser
    if ('serviceWorker' in navigator) {
      this.send(publicKey)
        .catch(err => {
          console.error(err);
        })
        .then(() => {
          console.log('envoie');
        });
    }
  }

  // Register SW, Register Push, Send Push
  async send(publicKey) {
    // Register Service Worker
    console.log('Registering service worker...');
    const register = await navigator.serviceWorker.register('../../assets/js/sw-notification.js');
    console.log('Service Worker Registered...');

    // Register Push
    console.log('Registering Push...');
    const subscription = await register.pushManager.subscribe({
      userVisibleOnly: true,
      applicationServerKey: this.urlBase64ToUint8Array(publicKey)
    });
    const info = {subNot: subscription, idUser: this.auth.getUserId()};
    console.log('-------------------------------------------------------------------------');
    console.log(JSON.stringify(info));
    console.log('-------------------------------------------------------------------------');
    console.log('Push Registered...');

    // Send Push Notification
    console.log('Sending Push...');
    await fetch('http://localhost:3000/api/notification/subscribe', {
      method: 'POST',
      body: JSON.stringify(info),
      headers: {
        'content-type': 'application/json'
      }
    });
  }

  // decrypt VAPID Key
  // tslint:disable-next-line:only-arrow-functions
  urlBase64ToUint8Array(base64String) {
    const padding = '='.repeat((4 - base64String.length % 4) % 4);
    const base64 = (base64String + padding)
      .replace(/\-/g, '+')
      .replace(/_/g, '/');

    const rawData = window.atob(base64);
    const outputArray = new Uint8Array(rawData.length);

    for (let i = 0; i < rawData.length; ++i) {
      outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
  }

  changeStateOfSubscription(state: number, iduser: number) {
    return new Promise((resolve, reject) => {
      this.serveur
        .post(this.serverUrl,
          { etatsub: state,
                  idUser: iduser },
          {responseType: 'json'})
        .subscribe(( response: { state: boolean} ) => {
            resolve(response.state);
        }, (error) => {

        });
    });

  }

  addNotification(titre: string, description: string, type: number, cible: number, qui: string, date: string) {
    return new Promise((resolve, reject) => {
      this.serveur
        .post(this.serverUrlAddNotif,
          {
            titre: titre,
            description: description,
            type: type,
            cible: cible,
            qui: qui,
            date: date
          },
          {responseType: 'json'})
        .subscribe(( response ) => {
          resolve(response);
        }, (error) => {

        });
    });
  }

  addUser(nom: string, prenom: string, login: string, password: string, group: number, qui: string, date: string) {
    return new Promise((resolve, reject) => {
      this.serveur
        .post(this.serverUrlAddUser,
          {
            nom: nom,
            prenom: prenom,
            login: login,
            password: password,
            group: group,
            qui: qui,
            date: date
          },
          {responseType: 'json'})
        .subscribe((rep ) => {
          resolve(rep);
        }, (error) => {

        });
    });
  }

  getNotification() {
    return new Promise((resolve, reject) => {
      this.serveur
        .post(this.serverUrlGetNotifications,
          {
            idUser: this.auth.getUserId()
          },
          {responseType: 'json'})
        .subscribe((response: { message: string, notifications: any }) => {
          console.log(response.notifications);
          resolve(response);
        });
    });
  }
}
