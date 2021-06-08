# Cognito

* Decentralized managed way for authtication
    * Sign-in, sing-up for you app
    * Social identity provider Facebook,..

<div style="text-align:center"><img src="/aws/Other/Cognito/archi.png"/></div>

* **Web Identity Provider**: exchange identity and security information between ***IdP*** and Application
* **Identity Provider:** Facebook, GitHub,...
* **Types**
    * SAML is of type Single Sign On (SSO)
    * OpenID
    * OAuth

* **User pools**
    * Dicentralized repository of users
    * Handles the actions
        * Sign-in
        * Sign-up
        * Account recovery
        * Account confirmation

* **Identity pools**
    * Provides ***temporary AWS credentials*** to access services eg. S3, DynamoDB, ...
    * It is generated using SDK

    <div style="text-align:center"><img src="/aws/Other/Cognito/identy_pool.png"/></div>

* **Cognito Sync**
    * Sync ***user data***  and ***preferences*** across devices with one line of code
    * Uses: 
        * **Push synchronization** to push updates and synchronize data
        * Simple Notification Service (SNS) to send notifications to all user devices when data in cloud changes
    
    <div style="text-align:center"><img src="/aws/Other/Cognito/sync.png"/></div>
    

    ### Conclusion

    <div style="text-align:center"><img src="/aws/Other/Cognito/resume.png"/></div>
    