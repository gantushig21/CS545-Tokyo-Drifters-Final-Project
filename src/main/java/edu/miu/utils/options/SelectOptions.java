package edu.miu.utils.options;

import java.util.HashMap;
import java.util.Map;

public class SelectOptions {
    public static Map<String, String> getCarStatus() {
        Map<String, String> status = new HashMap<>();

        status.put("available", "Available");
        status.put("not available", "Not Available");
        status.put("repairing", "Repairing");

        return status;
    }

    public static Map<String, String> getCarTypes() {
        Map<String, String> types = new HashMap<>();

        types.put("miniCar", "Mini Car");
        types.put("familyCar", "Family Car");
        types.put("pickup", "Pick Up");

        return types;
    }
}
