## Administration commands

```bash
# Create new containers
docker-compose exec rs3f add_container name_1,name_2

# List the available containers
docker-compose exec rs3f list_containers

# Add a user to some containers
docker-compose exec rs3f add_user name_1,name_2

# List the users in a container
docker-compose exec rs3f list_users name_1,name_2

# Remove some users for some containers
docker-compose exec rs3f delete_user name_1,name_2 username_1,username_2
```
