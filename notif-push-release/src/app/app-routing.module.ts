import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {LoginComponent} from './login/login.component';
import {SignupComponent} from './signup/signup.component';
import {NotFoundComponent} from './not-found/not-found.component';
import {DashboardComponent} from './dashboard/dashboard.component';
import {AuthGuardService} from './services/auth-guard.service';
import {AddNotificationComponent} from "./add-notification/add-notification.component";
import {ListNotificationsComponent} from "./list-notifications/list-notifications.component";
import {AddUserComponent} from './add-user/add-user.component';


const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'signup', component: SignupComponent },
  { path: 'dashboard', canActivate: [AuthGuardService], component: DashboardComponent},
  { path: 'list-notifications', canActivate: [AuthGuardService], component: ListNotificationsComponent},
  { path: 'add-notification', component: AddNotificationComponent},
  { path: 'add-user', component: AddUserComponent},
  { path: '', component: LoginComponent },
  { path: 'not-found', component: NotFoundComponent },
  { path: '**', redirectTo: '/not-found' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
