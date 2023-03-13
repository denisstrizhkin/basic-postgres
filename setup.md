# Install postgres

```console
$ sudo apt update -y
```

```console
$ sudo apt install postgresql -y
```

# Create new user and his db

```console
$ sudo -u postgres psql
```

```sql
CREATE USER denis WITH PASSWORD 'denis';
```

```sql
CREATE DATABASE denis OWNER denis;
```

# Enter postgres

```console
$ psql denis
```
