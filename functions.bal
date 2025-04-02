function generateWeatherTable(WeatherRecordList weatherRecords) returns string {
    string[] columns = ["   Date and Time   ", "Description", "Temperature", "Humidity", "Wind", "Cloud"];
    string separator = " | ";
    string wtable = separator;
    foreach var column in columns {
        wtable = wtable + column + separator;
    }
    wtable = wtable + "\n";
    foreach var wrecord in weatherRecords.list {
        wtable = wtable + separator + wrecord.dt_txt + separator + wrecord.weather[0].description + separator + (wrecord.main.temp - 273.0).round(2).toString() + separator + (wrecord.main.humidity).toString()
        + "%" + separator + (wrecord.wind.speed).toString() + " m/s, " + (wrecord.wind.deg).toString()
        + "°" + separator + (wrecord.clouds.all).toString() + "%" + separator + "\n";
    }
    wtable = wtable + "\n";
    return wtable;
}
