import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../services/authentification.service';
import {Router} from '@angular/router';
import {NgForm} from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  private authStatus: boolean;
  private userLogin: string;
  private userPass: string;

  constructor(private authService: AuthentificationService, private router: Router) { }

  ngOnInit() {
    this.authStatus = this.authService.getAuthentification();
  }
  /*
  onSignIn() {
    this.authService.signInUser().then(
      () => {
        console.log('Authentification done !');
        this.authStatus = this.authService.getAuthentification();
        this.router.navigate(['dashboard']);
      }
    );
  }
  */

  onSignOut() {
    this.authService.sinOutUser();
    this.authStatus = this.authService.getAuthentification();
  }

  onSubmit(form: NgForm) {
    console.log('Login : ' + form.value.email + '||' + form.value.pass);
    this.userLogin = form.value.email;
    this.userPass = form.value.pass;
    this.authService.signInUser(this.userLogin, this.userPass).then(
      (retour) => {
        console.log('le résultat : ' + retour);
        if (retour) {
          const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            onOpen: (toast) => {
              toast.addEventListener('mouseenter', Swal.stopTimer);
              toast.addEventListener('mouseleave', Swal.resumeTimer);
            }
          });
          Toast.fire({
            icon: 'success',
            title: 'Success'
          });
          this.router.navigate(['/dashboard']);
        } else {
          alert('Connexion échoué');
        }
      }
    );
  }

}
