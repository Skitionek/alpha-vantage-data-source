# AlphaVantage
[![Greenkeeper badge](https://badges.greenkeeper.io/Skitionek/alpha-vantage-data-source.svg)](https://greenkeeper.io/)
[![Intergation test](https://github.com/skitionek/alpha-vantage-data-source/workflows/Intergation%20test/badge.svg)](https://github.com/Skitionek/alpha-vantage-data-source/actions?query=workflow%3A%22Intergation+test%22)
[![CI](https://github.com/skitionek/alpha-vantage-data-source/workflows/CI/badge.svg)](https://github.com/Skitionek/alpha-vantage-data-source/actions?query=workflow%3ACI)

This is a simple wrapper around the [Alpha Vantage API](https://www.alphavantage.co/documentation/) hosted on [NPM](https://www.npmjs.com/package/alphavantage). I have no affiliation with AlphaVantage.

## Contents

1. [Installation](#installation)
2. [Usage](#usage)
    - [Data](#data)
    - [Forex](#forex)
    - [Crypto](#crypto)
    - [Technicals](#technicals)
    - [Performance](#performance)
    - [Util](#util)
3. [Coverage](#coverage)
4. [Testing](#testing)
5. [Mocking](#mocking)
6. [Data structure overview](#data_structure_overview)
7. [Contributing](#contributing)
8. [Credits](#credits)


## Installation
```bash
npm i alpha-vantage-data-source
```

## Usage

The library is initialised in straight forward manner by simply providing AlphaVantage access key:
```javascript
const alpha = require('alpha-vantage-data-source')({ key: 'demo' });
```
This access key might be set by environmental variable 'AV_KEY' if needed.

Once this library ins initialised, data can be accessed by navigating to functions corresponding to AlphaVantage API:
```javascript
alpha.data.intraday(`msft`)
alpha.data.batch([`msft`, `aapl`])
alpha.forex.rate('btc', 'usd')
alpha.crypto.daily('btc', 'usd')
alpha.technical.sma(`msft`, `daily`, 60, `close`)
alpha.performance.sector()
```

Whole list of available functions is as follows"

### Data

See [Alpha Vantage](https://www.alphavantage.co/documentation/#time-series-data) for the parameters.
```javascript
alpha.data.intraday(symbol, outputsize, datatype, interval)
alpha.data.daily(symbol, outputsize, datatype, interval)
alpha.data.daily_adjusted(symbol, outputsize, datatype, interval)
alpha.data.weekly(symbol, outputsize, datatype, interval)
alpha.data.weekly_adjusted(symbol, outputsize, datatype, interval)
alpha.data.monthly(symbol, outputsize, datatype, interval)
alpha.data.monthly_adjusted(symbol, outputsize, datatype, interval)
alpha.data.quote(symbol, outputsize, datatype, interval)
alpha.data.search(keywords)
alpha.data.batch([symbol1, symbol2..])
```

### Forex

See [Alpha Vantage](https://www.alphavantage.co/documentation/#fx) for the parameters.
```javascript
alpha.forex.rate(from_currency, to_currency)
```

### Crypto

See [Alpha Vantage](https://www.alphavantage.co/documentation/#digital-currency) for the parameters.

```javascript
alpha.crypto.daily(symbol, market)
alpha.crypto.weekly(symbol, market)
alpha.crypto.monthly(symbol, market)
```

### Technicals

See [Alpha Vantage](https://www.alphavantage.co/documentation/#technical-indicators) for the parameters.
```javascript
alpha.technical.sma(symbol, interval, time_period, series_type)
alpha.technical.ema(symbol, interval, time_period, series_type)
alpha.technical.wma(symbol, interval, time_period, series_type)
alpha.technical.dema(symbol, interval, time_period, series_type)
alpha.technical.tema(symbol, interval, time_period, series_type)
alpha.technical.trima(symbol, interval, time_period, series_type)
alpha.technical.kama(symbol, interval, time_period, series_type)
alpha.technical.mama(symbol, interval, series_type, fastlimit, slowlimit)
alpha.technical.t3(symbol, interval, time_period, series_type)
alpha.technical.macd(symbol, interval, series_type, fastperiod, slowperiod, signalperiod)
alpha.technical.macdext(symbol, interval, series_type, fastperiod, slowperiod, signalperiod, fastmatype, slowmatype, signalmatype)
alpha.technical.stoch(symbol, interval, fastkperiod, slowkperiod, slowdperiod, slowkmatype, slowdmatype)
alpha.technical.stochf(symbol, interval, fastkperiod, fastdperiod, fastdmatype)
alpha.technical.rsi(symbol, interval, time_period, series_type)
alpha.technical.stochrsi(symbol, interval, time_period, series_type, fastkperiod, slowdperiod, fastdmatype)
alpha.technical.willr(symbol, interval, time_period)
alpha.technical.adx(symbol, interval, time_period)
alpha.technical.adxr(symbol, interval, time_period)
alpha.technical.apo(symbol, interval, series_type, fastperiod, slowperiod, matype)
alpha.technical.ppo(symbol, interval, series_type, fastperiod, slowperiod, matype)
alpha.technical.mom(symbol, interval, time_period, series_type)
alpha.technical.bop(symbol, interval)
alpha.technical.cci(symbol, interval, time_period)
alpha.technical.cmo(symbol, interval, time_period, series_type)
alpha.technical.roc(symbol, interval, time_period, series_type)
alpha.technical.rocr(symbol, interval, time_period, series_type)
alpha.technical.aroon(symbol, interval, time_period)
alpha.technical.aroonosc(symbol, interval, time_period)
alpha.technical.mfi(symbol, interval, time_period)
alpha.technical.trix(symbol, interval, time_period, series_type)
alpha.technical.ultosc(symbol, interval, timeperiod1, timeperiod2, timeperiod3)
alpha.technical.dx(symbol, interval, time_period)
alpha.technical.minus_di(symbol, interval, time_period)
alpha.technical.plus_di(symbol, interval, time_period)
alpha.technical.minus_dm(symbol, interval, time_period)
alpha.technical.plus_dm(symbol, interval, time_period)
alpha.technical.bbands(symbol, interval, time_period, series_type, nbdevup, nbdevdn)
alpha.technical.midpoint(symbol, interval, time_period, series_type)
alpha.technical.midprice(symbol, interval, time_period)
alpha.technical.sar(symbol, interval, acceleration, maximum)
alpha.technical.trange(symbol, interval)
alpha.technical.atr(symbol, interval, time_period)
alpha.technical.natr(symbol, interval, time_period)
alpha.technical.ad(symbol, interval)
alpha.technical.adosc(symbol, interval, fastperiod, slowperiod)
alpha.technical.obv(symbol, interval)
alpha.technical.ht_trendline(symbol, interval, series_type)
alpha.technical.ht_sine(symbol, interval, series_type)
alpha.technical.ht_trendmode(symbol, interval, series_type)
alpha.technical.ht_dcperiod(symbol, interval, series_type)
alpha.technical.ht_dcphase(symbol, interval, series_type)
alpha.technical.ht_dcphasor(symbol, interval, series_type)
```

### Performance

See [Alpha Vantage](https://www.alphavantage.co/documentation/#sector-information) for the parameters.
```javascript
alpha.performance.sector()
```

### Util

Data polishing
  - Rewrite data keys to be consistent across all api calls. This is an optional utility you can use with the result of any api call.

```javascript
const polished = alpha.util.polish(data);
```

## Coverage

As of time of witting this library gives access you all data provided by AlphaVantage. Including comprehensive tests, unit as well as integration (integration tests are validating response for all queries available when using 'demo' key). 

## Testing

This package implements extensive testing, which is used to validate all functionally and also that this package remains up to date with currently exposed version of AlphaVantage API. Automatic cron job runs integration tests every day to keep track if API did not change.

## Mocking

Additionally this project also exposes internally used testing mocks. 
```javascript
const alpha_mocks = require('alpha-vantage-data-source/mocks')
```

## Data structure overview

For ease of integration structure of underlying data is summarised in autogenerated file 'ApiTree.json'. 

## Contributing

All contributions are welcome! This is an open source project under the MIT license, see [LICENSE.md](LICENSE.md) for additional information.

## Credits

Core has been forked from:
  - Author: Zack Urben
  - Twitter: https://twitter.com/zackurben (better)
  - Contact: zackurben@gmail.com
yet greatest part in common is it's structure. Current version support full API coverage, requests cache and non duck-typed keys normalisation.