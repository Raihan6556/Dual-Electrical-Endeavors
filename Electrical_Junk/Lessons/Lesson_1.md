# Electronics Fundamentals

---

## 1. Electric Current

Electric current is the rate of flow of electric charge through a conductor. In metallic conductors, these charges are free electrons in the outer shell of atoms.

* **Unit:** Ampere (A). 1 A = 1 Coulomb per second = 6.242 × 10^18 electrons/second.

### Types of Current
* **Direct Current (DC):** Electric charge flows continuously in one direction. Common in battery-powered electronics, USB devices, and microcontrollers.
* **Alternating Current (AC):** Electric charge periodically reverses direction and changes magnitude continuously. Used in mains power distribution because it can be stepped up or down efficiently using transformers.

### Microscopic Mechanics & Drift Velocity
* **Conventional Current vs. Electron Flow:** Real electrons (negatively charged) flow from negative potential to positive potential. Conventional current assumes current flows from positive to negative. All standard formulas and circuit diagrams use conventional current.
* **Drift Velocity:** Electrons inside a conductor do not move at the speed of light; they undergo random thermal motion and bounce off the atomic lattice. The net directional movement—**drift velocity (v_d)**—is remarkably slow (often fractions of a millimeter per second).
* **The Electric Field:** When voltage is applied across a wire, an electric field travels down the conductor near the speed of light (~10^8 m/s). This field instantly exerts force on electrons everywhere in the circuit at once, causing immediate power delivery despite the slow physical movement of individual electrons.

---

## 2. Voltage (Electric Potential Difference)

Voltage is the work required per unit charge to move a charge between two points in an electric field. It acts as the electrical pressure that drives current through a circuit.

### Mechanisms of Voltage
Voltage is established whenever there is an asymmetry or separation of electrical charges. Common methods of establishing voltage include:
* **Chemical Reactions:** Batteries separate charges by driving oxidation-reduction reactions at electrodes.
* **Electromagnetic Induction:** Generators rotate conductors through magnetic fields, inducing a force on charges.
* **Photovoltaic Effect:** Solar cells absorb photon energy to free electron-hole pairs across a semiconductor junction.

### Definition of a Volt & Generalized Power
* **Volt (V):** One volt is defined as one joule of work per coulomb of charge:
  1 V = 1 Joule / 1 Coulomb
* **Electromotive Force (EMF):** The maximum open-circuit potential difference supplied by an unloaded power source.
* **Generalized Electrical Power (P):** The rate at which energy is delivered or converted:
  P = V × I  (Watts = Joules/second)
  Combining with Ohm's Law (V = IR), power can also be written as:
  P = I^2 × R = V^2 / R; these are also used for power loss, more on that later, they are also derived via V=IR 

### Combining Batteries
* **Series Connection:** Connecting sources end-to-end (+ to -) **adds their voltages** together while maintaining the same current capacity (V_total = V1 + V2).
* **Parallel Connection:** Connecting matching polarities (+ to +, - to -) **keeps the voltage constant** while combining their current/amp-hour capacities (I_total = I1 + I2).

### Water Analogy
* **Voltage** ≈ **Water Pressure** (or height of a water tower).
* **Current** ≈ **Flow Rate** (gallons or liters per second through a pipe).
* **Resistance** ≈ **Pipe Diameter/Restriction** (narrow pipes restrict flow).

### Applying a Voltage
When a voltage source is connected across a closed loop, it sets up a potential gradient. This electric field forces free charges to move down the potential gradient, converting potential energy into kinetic energy (or thermal energy/work inside circuit components).

---

## 3. Resistance, Resistivity, and Conductivity

Resistance is a material's opposition to the passage of electric current, caused by collisions between drifting electrons and the vibrating atomic lattice of the material.

### How Shape Affects Resistance
The physical geometry of a conductor directly dictates its electrical resistance:
* **Length (L):** Resistance is **directly proportional** to length. A longer wire forces electrons to undergo more collisions along the path.
* **Cross-Sectional Area (A):** Resistance is **inversely proportional** to area. A larger area provides more parallel paths for charge carriers, reducing opposition.

### Mathematical Formula for Resistance
R = ρ × (L / A)

Where:
* R = Resistance in Ohms (Ω)
* ρ = Resistivity of the material (Ω·m)
* L = Length of the conductor (m)
* A = Cross-sectional area (m^2)

### Resistivity and Conductivity

* **Resistivity (ρ):** An intrinsic material property that measures how strongly a substance opposes the flow of electric current regardless of its shape.
  * Conductors (e.g., Copper, Silver): Low resistivity (~10^-8 Ω·m).
  * Insulators (e.g., Glass, Rubber): High resistivity (~10^10 to 10^16 Ω·m).

* **Conductivity (σ):** The measure of a material's ability to conduct electricity. It is the exact reciprocal of resistivity:
  σ = 1 / ρ  (Unit: Siemens per meter, S/m)

### Temperature Dependence
As a metal heats up, its atomic lattice vibrates more intensely, increasing the probability of electron collisions:
R(T) = R_0 × [1 + α × (T - T_0)]
Where α is the **temperature coefficient of resistance**. 
* **Conductors** have a positive α (resistance increases with heat).
* **Semiconductors** often have a negative α (heat frees thermal charge carriers, decreasing resistance).
