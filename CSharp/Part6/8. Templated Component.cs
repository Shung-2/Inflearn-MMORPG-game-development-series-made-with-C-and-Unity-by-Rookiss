﻿@page "/fetchdata"

@using BlazorApp.Data
@inject WeatherForecastService ForecastService

@*Templated Component는? *@
@*RenderFragment로 이루어진 Razor Component*@

<h1>Weather forecast</h1>

<p>This component demonstrates fetching data from a service.</p>

@if (forecasts == null)
{
    < p >< em > Loading...</ em ></ p >
}
else
{
    < TableTemplate Items = "forecasts" TItem = "WeatherForecast" >
   
           < Header >
   
               < th > Date </ th >
   
               < th > Temp. (C) </ th >
   
               < th > Temp. (F) </ th >
   
               < th > Summary </ th >
   
           </ Header >
   
           < Row Context = "forecast" >
    
                < td > @forecast.Date.ToShortDateString() </ td >
    
                < td > @forecast.TemperatureC </ td >
    
                < td > @forecast.TemperatureF </ td >
    
                < td > @forecast.Summary </ td >
    
            </ Row >
    
        </ TableTemplate >
}

@code
{
    private WeatherForecast[] forecasts;

protected override async Task OnInitializedAsync()
{
    forecasts = await ForecastService.GetForecastAsync(DateTime.Now);
}
}


@using BlazorApp.Data;
@typeparam TItem
@*TItem는 List<T>와 같다.*@
<h3>TableTemplate</h3>

<table class= "table" >
    < thead >
        < tr >
            @Header
        </ tr >
    </ thead >
    < tbody >
        @foreach(var item in Items)
        {
            < tr >
                @Row(item)
            </ tr >
        }
    </ tbody >
</ table >

@code {

    [Parameter]
    public RenderFragment Header { get; set; }

    [Parameter]
    public RenderFragment<TItem> Row { get; set; }

    [Parameter]
    public IReadOnlyList<TItem> Items { get; set; }
}
