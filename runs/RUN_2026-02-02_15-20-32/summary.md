
# CACE Summary for QDLL

**netlist source**: rcx

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Minimum Delay        | ngspice              | delay_min            |             any |          ​ |          any |          ​ |       500 ps |          ​ |   Skip 🟧    |
| Maximum Delay        | ngspice              | delay_max            |         2000 ps |          ​ |          any |          ​ |          any |          ​ |   Skip 🟧    |
| Delay Range          | ngspice              | delay_range          |         1500 ps |          ​ |          any |          ​ |          any |          ​ |   Skip 🟧    |
| Static Current       | ngspice              | idd_static           |             any |          ​ |          any |          ​ |       500 uA |          ​ |   Skip 🟧    |
| Dynamic Current      | ngspice              | idd_dynamic          |             any |          ​ |          any |          ​ |         5 mA |          ​ |   Skip 🟧    |
| PD Gain              | ngspice              | pd_gain              |       0.1 V/rad |          ​ |          any |          ​ |          any |          ​ |   Skip 🟧    |
| KLayout DRC          | klayout_drc          | drc_errors           |               ​ |          ​ |            ​ |          ​ |            0 |          ​ |   Skip 🟧    |

