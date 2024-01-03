# Java back-end API

exposes port 8080 for listening

## Endpoints
increases COUNT by 1 and returns:  
'{ "result": "pong: COUNT" }'

    /ping

following endpoints require auth or return:  
"message": "Full authentication is required to access this resource"  
"statusCode": 403

POST auth username and password and receive jwtToken

    /api/v1/auth/login

POST new customer  

    /api/v1/customers

GET all customers

    /api/v1/customers

GET customer by id

    /api/v1/customers/:id

PUT update customer by id

    /api/v1/customers/:id

DELETE customer by id

    /api/v1/customers/:id

POST customer profile image

    /api/v1/customers/:id/profile-image

GET customer profile image

    /api/v1/customers/:id/profile-image

## Notes
upon running creates a sample user with:
- randomly generated first name
- randomly generated last name
- email address in the format FIRSTNAME.LASTNAME@northcoders.com
- randomly generated age between 16 and 100
- hardcoded password of "password"

then prints the email address to the console