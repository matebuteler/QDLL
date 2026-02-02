# 500MHz Quadrature Delay Locked Loop (QDLL)

A Quadrature Delay Locked Loop design for the IHP SG13G2 process.

## Authors

- Leonardo Vazquez
- Martin Doric
- Clemente Molinari
- Santiago Basignana
- Matias Schulthess
- Mateo Buteler

**Organization:** Fundacion Fulgor

## Project Description

This repository contains the design files for a 500MHz Quadrature Delay Locked Loop targeting tapeout on the IHP SG13G2 process.

## Repository Structure

```
.
├── xschem/          # Xschem schematics
│   ├── Cells/       # Cell-level designs
│   ├── testbenches/ # Testbench schematics
│   └── ...
├── gds/             # Layout files (GDS)
├── netlist/         # SPICE netlists and extracted circuits
├── doc/             # Documentation
└── char/            # CACE characterization files
```

## Dependencies

This design uses components from the following sources:

### [IIC-OSIC-TOOLS](https://github.com/iic-jku/IIC-OSIC-TOOLS)
Docker image containing all the necessary tools for EDA (xschem, KLayout, CACE, ngspice...)

### IHP SG13G2 PDK
- Standard cells and primitives from the IHP SG13G2 Process Design Kit
- Process: 130nm BiCMOS technology

### IHP-Open-PDK IO Library

**The sg13g2_IOPad*** symbols and related IO components are from:**

**[Krzysztof Herman's IHP-Open-PDK](https://github.com/KrzysztofHerman/IHP-Open-PDK)**

This includes:
- `sg13g2_IOPadIOVdd` - IO pad for IO power supply
- `sg13g2_IOPadIOVss` - IO pad for IO ground
- `sg13g2_IOPadVdd` - IO pad for core power supply
- `sg13g2_IOPadVSS` - IO pad for core ground
- `sg13g2_IOPadAnalog` - Analog IO pad
- `sg13g2_IOPadIn` - Input pad
- `sg13g2_IOPadOut` - Output pad variants
- And related IO protection and level-shifting circuits

**Repository:** https://github.com/KrzysztofHerman/IHP-Open-PDK  
**Branch:** `IO-xschem`
**Path:** `ihp-sg13g2/libs.ref/sg13g2_io/xschem/`  
**Direct Link:** https://github.com/KrzysztofHerman/IHP-Open-PDK/tree/IO-xschem/ihp-sg13g2/libs.ref/sg13g2_io/xschem

**Credit:** Special thanks to Krzysztof Herman for developing and maintaining the IHP-Open-PDK IO library, which provides essential IO pad components for IHP SG13G2 designs.

## License

Apache 2.0

## Status

Status: Proposed (tapeout target)

## Usage

### Opening Schematics

To open schematics with xschem:

```bash
cd xschem
xschem testbenches/tb_QDLL_TOP.sch
```

**Note:** Requires xschem and the IHP SG13G2 PDK to be properly installed and configured, including the sg13g2_io library from IHP-Open-PDK (IO-xschem branch).

## CACE Characterization

The design includes CACE configuration for automated characterization. See `char/datasheet.yaml` for details.

Paths are configured as:
- Schematics: `xschem/`
- Layouts: `gds/`
- Netlists: `netlist/`
- Documentation: `doc/`
