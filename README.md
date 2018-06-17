# NodeBB-plugin-AzureStorage

An upload plugin for NodeBB to use Azure Storage Blob Serivce as file storage backend which also supports CDN endpoint.

## Setup

This plugin won't create the Container. Before use this, you should create a container in blob service.

ACL should be set to *Blob* or *Container* ( not recommended ), or forum users can't access the file.

### Environment 

```bash
export AZURE_STORAGE_ACCOUNT="xxxxx"
# this is your azure storage account
export AZURE_STORAGE_ACCESS_KEY="yyyyy"
# this is your azure storage key
export AZURE_STORAGE_CONTAINER="zzzz"
# this is your azure storage blob service container name
export AZURE_STORAGE_HOSTNAME="host"
# if you need to specify a different hostname, for example: CDN usage, set it with domain name, or leave it empty
# required http:// or https://
export AZURE_STORAGE_PATH="path"
# if you need to specify a path where all files will be put into, just like /assets, set it.
# url returned will be appended with this path, too
# prepend /
```

### Database

**Not  Recommended**

You can set it from Admin Panel, but it's not recommended, because storage account and key will be stored in **plain text**, and all admins can check it from admin panel.

Settings from database is top priority.

## File Storage

All files uploaded will be renamed. For example, ```somepicture-iob0ucoj.png```.

Especially, if filename contains whitespace, the whitespace(s) will be converted to underscore "_".

If you want to make it convenient to manage, it can be found in ```library.js``` and ```function uploadToAzureStorage```.

## LICENSE

MIT LICENSE

*Check LICENSE file.*
