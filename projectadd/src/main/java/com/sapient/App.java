package com.sapient;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World! Welcome to Maven project" );
        System.out.println( new App().add(2,3));
    }

    public static int add (int a, int b)
    {
       return a+b;
    }
}
