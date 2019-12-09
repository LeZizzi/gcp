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
