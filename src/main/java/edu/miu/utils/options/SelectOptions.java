package edu.miu.utils.options;

import java.util.HashMap;

public class SelectOptions {
    public static HashMap<String, String> getCarStatus() {
        HashMap<String, String> status = new HashMap<>();

        status.put("repair", "Repair");
        status.put("not available", "Not Available");
        status.put("available", "Available");

        return status;
    }

    public static HashMap<String, String> getCarTypes() {
        HashMap<String, String> types = new HashMap<>();

        types.put("familyCar", "Family Car");
        types.put("pickup", "Pick Up");
        types.put("miniCar", "Mini Car");

        return types;
    }
}
