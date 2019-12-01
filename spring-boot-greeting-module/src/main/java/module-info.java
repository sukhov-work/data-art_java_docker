module greeting.module {
    requires java.desktop;
    requires spring.core;
    requires spring.boot.autoconfigure;
    requires spring.boot;
    requires spring.context;
    requires spring.web;
    requires spring.beans;
    opens hello;
    exports hello;
}