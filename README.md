# gcp
gcp
Managing service account keys

There are two types of service account keys:

    GCP-managed keys. These keys are used by Cloud Platform services such as App Engine and Compute Engine. They cannot be downloaded, and are automatically rotated and used for signing for a maximum of two weeks. The rotation process is probabilistic; usage of the new key will gradually ramp up and down over the key's lifetime. We recommend caching the public key set for a service account for at most 24 hours to ensure that you always have access to the current key set.

    User-managed keys. These keys are created, downloadable, and managed by users. They expire 10 years from creation, and cease authenticating successfully when they are deleted from the service account.

For user-managed keys, you need to make sure that you have processes in place to address key management requirements such as:

    Key storage
    Key distribution
    Key revocation
    Key rotation
    Protecting the keys from unauthorized users
    Key recovery

Anyone who has access to a valid private key for a service account will be able to access resources through the service account. Note that the lifecycle of the key's access to the service account (and thus, the data the service account has access to) is independent of the lifecycle of the user who has downloaded the key.

Always discourage developers from checking keys into the source code or leaving them in the Downloads directory of their workstation.

To enhance the security of keys, follow the guidance below:

    Use the IAM service account API to automatically rotate your service account keys. You can rotate a key by creating a new key, switching applications to use the new key and then deleting the old key. Use the serviceAccount.keys.create() and serviceAccount.keys.delete() methods together to automate the rotation. The GCP-managed keys are rotated approximately once a week.
        Use the serviceAccount.keys.list() method to audit service accounts and keys.

Using service accounts with Compute Engine

Compute Engine instances need to run as service accounts to have access to other Cloud Platform resources. To make sure that your Compute Engine instances are secure, consider the following:

    You can create VMs in the same project with different service accounts. To change the service account of a VM after it's created, use the instances.setServiceAccount method.

    You can grant IAM roles to service accounts to define what they can access. In many cases you won't need to rely on scopes anymore. This gives you the advantage of being able to modify permissions of a VM's service account without recreating the instance.

    Since instances depend on their service accounts to have access to Cloud Platform resources, avoid deleting service accounts when they are still used by running instances. If you delete the service accounts, the instances may start failing their operations.

Best practices

    Restrict who can act as service accounts. Users who are Service Account Users for a service account can indirectly access all the resources the service account has access to. Therefore, be cautious when granting the serviceAccountUser role to a user.

    Grant the service account only the minimum set of permissions required to achieve their goal. Learn about Granting roles to a service account for specific resources.

    Create service accounts for each service with only the permissions required for that service.

    Use the display name of a service account to keep track of the service accounts. When you create a service account, populate its display name with the purpose of the service account.

    Define a naming convention for your service accounts.

    Implement processes to automate the rotation of user-managed service account keys.

    Take advantage of the IAM service account API to implement key rotation.

    Audit service accounts and keys using either the serviceAccount.keys.list() method or the Logs Viewer page in the console.

    Do not delete service accounts that are in use by running instances on App Engine or Compute Engine unless you want those applications to lose access to the service account.
