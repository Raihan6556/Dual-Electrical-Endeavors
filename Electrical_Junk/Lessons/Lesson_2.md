# Electronics Fundamentals Lesson 2

---

## 2.6 Insulators, Conductors, and Semiconductors

Materials are classified by how easily they allow electrons to flow through them, determined by their atomic structure and electron energy bands (valence band vs. conduction band). Chemistry lowk useful here

* **Conductors (e.g., Copper, Gold, Aluminum):**
  * Have free electrons in their outermost shell (valence electrons) that require very little energy to break free.
  * Their valence and conduction bands overlap or have a negligible energy gap, allowing electrons to move freely under a tiny electric field.
* **Insulators (e.g., Glass, Rubber, Plastic, Air):**
  * Electrons are tightly bound to their parent atoms.
  * Have a large band gap, meaning a massive amount of voltage is required to force electrons into the conduction band (breakdown voltage).
* **Semiconductors, big boys (e.g., Silicon, Germanium):**
  * Have a moderate band gap. At absolute zero, they act as insulators.
  * As temperature rises or when "doped" with impurities (creating N-type and P-type materials), they allow controlled current flow, forming the foundation of diodes, transistors, and integrated circuits.

---

## 2.7 Heat and Power

When current flows through a resistance, electrical energy is converted into thermal energy (heat) via Joule heating.

* **Power Dissipation Formulas:**
  * P = V × I
  * P = I^2 × R
  * P = V^2 / R
  * Derivation explained in lesson, see if you can derive yourself using V = IR, hint: substitution 
* **Thermal Consequences:** Every component has a maximum power rating (Watts). Exceeding this rating causes excess heat, which can alter component values, melt solder joints, or permanently destroy semiconductor junctions. Its bad trust me... Once started a fire at 3AM in tokyo

---

## 2.8 Thermal Heat Conduction and Thermal Resistance

Heat transfer in electronics mimics Ohm's Law, where temperature difference acts like voltage, heat flow acts like current, and thermal opposition acts like resistance.

* **Thermal Resistance (R_th or R_theta):**
  * Measured in degrees Celsius per Watt (degC/W).
  * Formula: R_th = Delta T / P (where Delta T is the temperature difference and P is power dissipated in Watts).
* **Heatsinks:** Used to lower thermal resistance between a hot component (like a power transistor) and the ambient air, keeping internal temperatures below maximum safe limits.

### 2.8.1 Importance of Heat Production
* **Thermal Runaway:** In certain semiconductor devices (like bipolar junction transistors), higher temperatures increase current flow, which in turn generates more heat, potentially leading to catastrophic failure unless thermal feedback is managed.
* **Derating:** High-performance circuits require calculating ambient temperatures and using heatsinks or forced-air cooling to ensure components operate within safe thermal margins.

---

## 2.9 Wire Gauges

The American Wire Gauge (AWG) system standardizes the cross-sectional area and diameter of round wires.

* **The AWG Rule:** 
  * **Higher gauge numbers mean thinner wires** (e.g., 30 AWG is very thin; 10 AWG is thick).
  * As wire gauge increases by 6, the diameter roughly halves; as it increases by 3, the cross-sectional area halves.
* **Resistance & Ampacity:**
  * Thinner wires have higher resistance per unit length, leading to voltage drops over long distances. You will formally learn this later, but resistors in series add up, R_1 + R_2 + R_3... = R_total
  * Thicker wires have higher **ampacity** (the maximum current a wire can safely carry before overheating and melting its insulation).

---

## 2.10 Grounds

"Ground" is a relative reference point in a circuit defined as zero volts (0V), acting as a common return path for current. This is the most important thing to remember here, reminder that voltage is RELATIVE, and voltage at a certain point is determined by where the ground is located, more on this in the future.

### 2.10.1 Earth Ground
* A physical connection to the conductive mass of the Earth via a metal rod driven into the ground or through the green/yellow wire in mains electrical outlets.
* Primarily used for **safety** (diverting fault currents away from human touch to trip circuit breakers).

### 2.10.2 Different Types of Ground Symbols
* **Chassis Ground:** Tied to the metal enclosure or frame of a device (often for shielding and safety).
* **Analog Ground (AGND):** A quiet reference point used for sensitive analog measurement circuits to avoid digital noise.
* **Digital Ground (DGND):** The return path for high-speed switching digital logic, which can carry transient noise.
* **Earth Ground Symbol:** Typically represented by three stacked horizontal lines of decreasing width or a rake-like symbol.

### 2.10.3 Loose Ends on Grounding
* **Ground Loops:** Unwanted closed loops formed when multiple grounds are connected at different points, creating stray circulating currents and magnetic interference (hum/noise).
* **Single-Point (Star) Grounding:** Connecting all circuit ground returns back to a single central node to minimize interference in mixed-signal systems.

---

## 2.11 Electric Circuits

An electric circuit is a closed loop or pathway that allows electric charges to flow continuously to perform useful work.

* **Core Elements:**
  * **Source:** Provides voltage/energy (e.g., battery, power supply).
  * **Load:** Consumes energy to do work (e.g., resistor, motor, LED).
  * **Conductors:** Provide the closed path for current to travel between source and load.
* **Nodes and Branches:**
  * **Node:** A junction point where two or more circuit components connect.
  * **Branch:** A path connecting two nodes containing one or more components.
* **Closed vs. Open Circuits:** Current only flows when the loop is **closed** (complete continuity). If a break occurs (an **open circuit**), current drops to zero immediately. If a low-resistance path bypasses the load, it creates a dangerous **short circuit** leading to high current and rapid heat generation.
* As you already know, series vs parallel. Reminder that current is uniform in series, and voltage is uniform in parallel
