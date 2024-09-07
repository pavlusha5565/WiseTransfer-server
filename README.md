### Firezone ( wireguard )

- Create environment file for firezone:
```
docker run --rm firezone/firezone bin/gen-env > .env
```

- After creating, change the DEFAULT_ADMIN_EMAIL and EXTERNAL_URL variables. 
Optionally modify other secrets as needed.

- Migrate the database:
```
docker compose run --rm firezone bin/migrate
```

- Create the first admin:
```
docker compose run --rm firezone bin/create-or-reset-admin
```

DEFAULT_ADMIN_EMAIL=pavlusha5565@gmail.com
DEFAULT_ADMIN_PASSWORD=5BMgBNSbqqXE1W9M