import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { SignupComponent } from './signup/signup.component';
import { NotFoundComponent } from './not-found/not-found.component';

import { AuthService } from './services/auth.service';
import { HttpClientModule } from '@angular/common/http';
import {AuthGuardService} from './services/auth-guard.service';
import {ReactiveFormsModule} from '@angular/forms';
import { DashboardComponent } from './dashboard/dashboard.component';
import {NotificationService} from './services/notification.service';
import { AddNotificationComponent } from './add-notification/add-notification.component';
import { AddUserComponent } from './add-user/add-user.component';
import { ListNotificationsComponent } from './list-notifications/list-notifications.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    SignupComponent,
    NotFoundComponent,
    DashboardComponent,
    AddNotificationComponent,
    AddUserComponent,
    ListNotificationsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule
  ],
  providers: [
    AuthService,
    AuthGuardService,
    NotificationService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
