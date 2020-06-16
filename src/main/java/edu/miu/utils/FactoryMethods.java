package edu.miu.utils;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class FactoryMethods {
    public static int daysBetweenTwoDate(LocalDate from, LocalDate to) {
        return (int) ChronoUnit.DAYS.between(from, to);
    }
}
