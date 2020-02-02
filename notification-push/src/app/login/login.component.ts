import { Component, OnInit } from '@angular/core';
import {AuthentificationService} from '../services/authentification.service';
import {Router} from '@angular/router';
import {NgForm} from '@angular/forms';
import Swal from 'sweetalert2';

const Toast = Swal.mixin({
  toast: true,
  position: 'top',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer);
    toast.addEventListener('mouseleave', Swal.resumeTimer);
  }
});

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
          Toast.fire({
            icon: 'success',
            title: 'Connexion réussie'
          });
          this.router.navigate(['/dashboard']);
        } else {
          Toast.fire({
            icon: 'error',
            title: 'Login ou mot de pass incorrecte'
          });
        }
      }
    );
  }

}
