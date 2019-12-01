package org.acme.quickstart;


import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/")
public class GreetingResource {

    @Inject
    GreetingService service;

    @GET
    @Path("/hi")
    @Produces(MediaType.TEXT_PLAIN)
    public String home() {
        return "Hello Quarkus Docker World";
    }

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Path("/greeting/{name}")
    public String greeting(@PathParam("name") String name) {
        return service.greeting(name);
    }


}/**/