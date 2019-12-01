package com.example;

import java.util.Objects;

public class TestObj {

    int intField;
    long longField;
    double doubleField;

    public TestObj(int intField, long longField, double doubleField) {
        this.intField = intField;
        this.longField = longField;
        this.doubleField = doubleField;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TestObj)) return false;
        TestObj testObj = (TestObj) o;
        return intField == testObj.intField &&
                longField == testObj.longField &&
                Double.compare(testObj.doubleField, doubleField) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(intField, longField, doubleField);
    }


    public int hashCodeSimple() {
        return ((intField * 31) + Long.hashCode(longField)) * 31 + Double.hashCode(doubleField);
    }
}
