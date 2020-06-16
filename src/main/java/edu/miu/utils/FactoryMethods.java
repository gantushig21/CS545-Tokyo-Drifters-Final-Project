package edu.miu.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;

public class FactoryMethods {
    public static int daysBetweenTwoDate(LocalDate from, LocalDate to) {
        return (int) ChronoUnit.DAYS.between(from, to);
    }

    public static ObjectMapper mapper = new ObjectMapper();

    public static HashMap<String, String> jsonToMap(String json) {
        HashMap<String, String> map = new HashMap<>();
        try {
            map = mapper.readValue(json, HashMap.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }
}
