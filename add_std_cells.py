# ---------------------------------------------------------------------
#  SG13G2 macro – custom polygons + import of sg13g2_inv_1 from library
# ---------------------------------------------------------------------
import pya

# ---------- 1. Context ------------------------------------------------
app     = pya.Application.instance()
layout  = app.main_window().current_view().active_cellview().layout()
top     = layout.top_cell()
dbu     = layout.dbu                     # 1 nm with the open PDK

# ---------- 2. Layer handles (unchanged from previous script) ---------
L_ACTIV      = layout.layer(pya.LayerInfo(1,  0))   # Activ:drawing
L_PSD        = layout.layer(pya.LayerInfo(14, 0))   # pSD:drawing
L_CONT       = layout.layer(pya.LayerInfo(6,  0))   # Cont:drawing
L_M1         = layout.layer(pya.LayerInfo(8,  0))   # Metal1:drawing
L_M1_PIN     = layout.layer(pya.LayerInfo(8,  2))   # Metal1:pin

# ---------- 3. Helpers ------------------------------------------------
def um2dbu(v_um: float) -> int:
    return int(v_um / dbu)

def add_box(layer, x1_um, y1_um, x2_um, y2_um):
    box = pya.Box(um2dbu(x1_um), um2dbu(y1_um),
                  um2dbu(x2_um), um2dbu(y2_um))
    top.shapes(layer).insert(box)

# ---------- 4. Your custom geometry ----------------------------------
# Example Metal-1 rectangle from the earlier code
#add_box(L_M1, 6.67000, -0.32000, 6.83000, 0.92000)

# Four identical rectangles on several layers
#common = dict(x1_um=6.59000, y1_um=-0.47500,
#              x2_um=6.91000, y2_um=-0.15500)
#for layer in (L_ACTIV, L_PSD, L_M1, L_M1_PIN):
#    add_box(layer, **common)

# Contact window
#add_box(L_CONT, 6.67000, -0.39500, 6.83000, -0.23000)

# ---------- 5. Import the standard-cell GDS ---------------------------
stdcell_gds = "/foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/gds/sg13g2_stdcell.gds"

opt = pya.LoadLayoutOptions()
opt.keep_cells  = True     # merge instead of replacing
opt.dbu         = dbu      # force same database unit (usually 0.001 µm)

layout.read(stdcell_gds, opt)   # cells are now part of this layout

# ---------- 6. Place SPG instance ----------------------------
# --- Place sg13g2_inv_1.sym (3 instances) ---
""" x_um, y_um = 1.0, 1.0
x2_um, y2_um = 5.32, 1.0
x3_um, y3_um = 9.64, 1.0

inv_cell1 = layout.cell("sg13g2_xor2_1")
if inv_cell1 is None:
    raise RuntimeError("Cell 'sg13g2_xor2_1' not found in the library GDS.")

top.insert(pya.CellInstArray(inv_cell1.cell_index(), pya.Trans(pya.Vector(um2dbu(0.0), um2dbu(4.0)))))
top.insert(pya.CellInstArray(inv_cell1.cell_index(), pya.Trans(pya.Vector(um2dbu(2.0), um2dbu(4.0)))))
top.insert(pya.CellInstArray(inv_cell1.cell_index(), pya.Trans(pya.Vector(um2dbu(3.0), um2dbu(4.0)))))

inv_cell2 = layout.cell("sg13g2_inv_2")
if inv_cell2 is None:
    raise RuntimeError("Cell 'sg13g2_inv_2' not found in the library GDS.")

top.insert(pya.CellInstArray(inv_cell2.cell_index(), pya.Trans(pya.Vector(um2dbu(4.0), um2dbu(4.0)))))
# --- Place sg13g2_and2_1 (2 instances) ---
and3_cell = layout.cell("sg13g2_and2_1")
if and3_cell is None:
    raise RuntimeError("Cell 'sg13g2_and2_1' not found in the library GDS.")

for i in range(4):
    x_and = 4.0 + i * 2.0  # space by 2um
    top.insert(pya.CellInstArray(and3_cell.cell_index(), pya.Trans(pya.Vector(um2dbu(x_and), um2dbu(4.0)))))
 """



# ---------- 7. (Optional) Save result --------------------------------
#layout.write("updated_with_dly.gds")
#print("Layout updated – sg13g2_dlygate4sd3_1 placed at ({:.3f}, {:.3f}), ({:.3f}, {:.3f}) and ({:.3f}, {:.3f}) µm".format(x_um, y_um,x2_um, y2_um,x3_um, y3_um))

# Enter your Python code here


