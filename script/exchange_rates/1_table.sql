-- Source: https://appsso.eurostat.ec.europa.eu/nui/show.do?dataset=ert_bil_eur_a&lang=en

DROP TABLE IF EXISTS real.eur_exchange_rates;

CREATE TABLE real.eur_exchange_rates (
  currency VARCHAR(3) COLLATE "default",
  rate NUMERIC
)

WITH(OIDS=false);


INSERT INTO real.eur_exchange_rates (currency, rate)
VALUES
  ('BGN',1.9558),
  ('CZK',25.670),
  ('DKK',7.466),
  ('GBP',0.87777),
  ('HRK',7.41800),
  ('HUF',325.30),
  ('PLN',4.2976),
  ('LEI',4.7453);
