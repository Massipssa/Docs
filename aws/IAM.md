# Identity Access Management (IAM)
* **User:** identity to be identified in AWS account
    * Tow types access:
        * Programmatic
        * AWS management access
    * Once new user is created => new url to login into the account will be generated
* **Group:** set of users
* **Role:**
    * Is an IAM entity that defines a set of permissions for making AWS service request
    * Ex: give acces to EC2 a full accees to S3

* **Policy:** to assign a permission to a users, group, or resource we create a policy, which is a document which explicitly lists permissions
* **Policy Types**
    * Managed
        * Created by AWS
        * Read only
    * Customer
        * Created by the user
        * Are readable
    * Inline
        * Attatched directly to the user

### Access Keys

* Allows programmatical access to AWS
* Contains
    * Access Key ID
    * Secret Access Key
* A user can have only ***two*** access key

### Multi-Factor Authentication

* User to turn it on, administrator can not enable it
* Adminsitrator can restrict access for example to user that only have MFA
