# Shiny in a container

The purpose of the project is to distribute Shiny into multiple instances, or containers. That eliminates the single threadedness of the default Shiny-Server. If one user issues a database (DB) query, then the second has to wait until it is finished.

The Shiny application which is to be deployed is DB heavy. That means the execution time of each query is long and the probability of second user having to wait is significant.

To distribute users between containers NGINX server is used in front. NGINX provides a login functionality that can redirect users to specific Shiny subpages based on credentials.

## PODMAN

First step of the project is to have the container built. An objective is to have the image size as small as possible. Another is to have all the necessary R libraries already available in the image.


## ROADMAP

Research and open work tracked in Issues.
