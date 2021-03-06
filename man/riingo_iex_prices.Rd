% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prices.R
\name{riingo_iex_prices}
\alias{riingo_iex_prices}
\title{Get stock or ETF prices from IEX through Tiingo}
\usage{
riingo_iex_prices(ticker, start_date = NULL, end_date = NULL,
  resample_frequency = "5min")
}
\arguments{
\item{ticker}{One or more tickers to download data for from Tiingo. Can be a
stock, mutual fund, or ETF. A character vector.}

\item{start_date}{The first date to download data for.
A character in the form YYYY-MM-DD, or a \code{Date} variable. The default is to
download 1 year's worth of data.}

\item{end_date}{The last date to download data for.
A character in the form YYYY-MM-DD, or a \code{Date} variable.}

\item{resample_frequency}{For Tiingo data, a character specified as one of:
\code{"daily"}, \code{"monthly"}, \code{"quarterly"} or \code{"yearly"}. For IEX data, a character
specified at the \code{"min"} or \code{"hour"} frequencies in the form:
\code{"1min"}, \code{"5min"}, or \code{"2hour"}. For Crypto data, a character specified at
the \code{"min"}, \code{"hour"} or \code{"day"} frequencies similar to IEX.}
}
\description{
The Tiingo API provides a way to access data from IEX, The Investors Exchange.
This data is supplied at a much lower (intraday!) frequency than the data from Tiingo's
native API.
}
\details{
This feed returns the most recent 2000 ticks of data at the specified frequency.
For example, \code{"5min"} would return the 2000 most recent data points spaced 5 minutes apart.
You can subset the returned range with \code{start_date} and \code{end_date}, but \strong{you cannot
request data older than today's date minus 2000 data points.}

Because the default attempts to pull 1 year's worth of data, at a 5 minute
frequency, all available data will be pulled so there is no need to use
\code{start_date} and \code{end_date}. Only use them if you set the frequency to hourly.
}
\examples{

\dontrun{

# Pulling all available minute level data for Apple
riingo_iex_prices("AAPL", resample_frequency = "1min")

# This would result in an error, as you are pulling outside the available range
# riingo_iex_prices("AAPL", "1990-01-01", "2000-01-01", resample_frequency = "5min")

}

}
