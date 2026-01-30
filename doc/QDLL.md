# QDLL

- Description: 100MHz Quadrature Delay Locked Loop
- PDK: ihp-sg13g2

## Authorship

- Designer: Leonardo Vazquez, Martin Doric, Clemente Molinari, Santiago Basignana, Matias Schulthess, Mateo Buteler
- Company: Fundacion Fulgor
- Created: 2026
- License: Apache 2.0
- Last modified: None

## Pins

- VDD
  + Description: Power supply
  + Direction: inout
  + Type: power
  + Vmin: 1.7
  + Vmax: 1.9
- VSS
  + Description: Ground supply
  + Direction: inout
  + Type: ground
  + Vmin: 0
  + Vmax: 0

## Default Conditions

- Vvdd
  + Description: Supply voltage
  + Display: Vdd
  + Unit: V
  + Typical: 1.8
- Vvss
  + Description: Ground voltage
  + Display: Vss
  + Unit: V
  + Typical: 0
- temperature
  + Description: Ambient temperature
  + Display: Temp
  + Unit: degC
  + Typical: 27
- corner
  + Description: Process corner
  + Display: Corner
  + Typical: tt

## Symbol

![Symbol of QDLL](QDLL_symbol.svg)

## Schematic

![Schematic of QDLL](QDLL_schematic.svg)

## Layout

![Layout of QDLL with white background](QDLL_w.png)
![Layout of QDLL with black background](QDLL_b.png)
