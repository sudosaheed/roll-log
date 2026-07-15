//
//  FilmThemes.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

struct FilmTheme {
    let name: String
    let brand: String
    let primaryColor: Color
    let secondaryColor: Color
    let textColor: Color
    // Chosen per-theme for readability against primaryColor — white text on a dark red band,
    // black text on a pale pastel band, etc.

    let synonyms: [String]
    // All the ways someone might type this film stock's name. Checked in order, most specific first.

    static let all: [FilmTheme] = [
        // Kodak

        FilmTheme(
            name: "Portra 800", brand: "Kodak",
            primaryColor: Color(red: 0.68, green: 0.60, blue: 0.80),   // lavender
            secondaryColor: Color(red: 0.96, green: 0.93, blue: 0.85), // cream
            textColor: .black,
            synonyms: ["portra 800"]
        ),
        FilmTheme(
            name: "Portra 400", brand: "Kodak",
            primaryColor: Color(red: 0.68, green: 0.60, blue: 0.80),   // lavender
            secondaryColor: Color(red: 0.96, green: 0.93, blue: 0.85), // cream
            textColor: .black,
            synonyms: ["portra 400"]
        ),
        FilmTheme(
            name: "Portra", brand: "Kodak",
            primaryColor: Color(red: 0.68, green: 0.60, blue: 0.80),
            secondaryColor: Color(red: 0.96, green: 0.93, blue: 0.85),
            textColor: .black,
            synonyms: ["portra"]
            //
        ),
        FilmTheme(
            name: "Gold 200", brand: "Kodak",
            primaryColor: Color(red: 0.62, green: 0.13, blue: 0.42),   // deep magenta
            secondaryColor: Color(red: 0.98, green: 0.76, blue: 0.12), // Kodak yellow
            textColor: .white,
            synonyms: ["gold"]
        ),
        FilmTheme(
            name: "ColorPlus 200", brand: "Kodak",
            primaryColor: Color(red: 0.86, green: 0.08, blue: 0.14),   // vivid red — punchier red panel on the real box
            secondaryColor: Color(red: 0.97, green: 0.78, blue: 0.14), // golden yellow — the box's lower band
            textColor: .white,
            synonyms: ["colorplus", "color plus", "colour plus"]
        ),
        FilmTheme(
            name: "UltraMax 400", brand: "Kodak",
            primaryColor: Color(red: 0.68, green: 0.82, blue: 0.92),   // pastel blue
            secondaryColor: Color(red: 0.98, green: 0.95, blue: 0.85),
            textColor: .black,
            synonyms: ["ultramax"]
        ),
        FilmTheme(
            name: "Ektachrome E100", brand: "Kodak",
            primaryColor: Color(red: 0.05, green: 0.45, blue: 0.50),   // teal — the box's dominant colour
            secondaryColor: Color(red: 0.90, green: 0.75, blue: 0.20), // gold — the Kodak wordmark band
            textColor: .white,
            synonyms: ["ektachrome", "ektarchrome", "e100"]
            // ^ Must come before Ektar 100 below: "ektarchrome" (an easy typo/mishearing of Ektachrome)
            // contains "ektar" as a substring, so if Ektar 100 were checked first it would steal the match.
        ),
        FilmTheme(
            name: "Ektar 100", brand: "Kodak",
            primaryColor: Color(red: 0.93, green: 0.75, blue: 0.25),   // gold — the "EKTAR" wordmark / sunburst logo
            secondaryColor: Color(red: 0.24, green: 0.14, blue: 0.08), // chocolate brown — the box's dominant body colour
            textColor: .white,
            synonyms: ["ektar"]
        ),
        FilmTheme(
            name: "Pro Image 100", brand: "Kodak",
            primaryColor: Color(red: 0.93, green: 0.75, blue: 0.25),   // gold — the "EKTAR" wordmark / sunburst logo
            secondaryColor: Color(red: 0.24, green: 0.14, blue: 0.08), // chocolate brown — the box's dominant body colour
            textColor: .black,
            synonyms: ["pro image", "proimage"]
        ),
        FilmTheme(
            name: "Double-X", brand: "Kodak",
            primaryColor: Color(red: 0.25, green: 0.25, blue: 0.25),   // charcoal
            secondaryColor: Color(red: 0.55, green: 0.55, blue: 0.55),
            textColor: .white,
            synonyms: ["bwxx", "double-x", "double x", "5222"]
        ),
        FilmTheme(
            name: "Vision3 250D", brand: "Kodak",
            primaryColor: Color(red: 0.08, green: 0.08, blue: 0.08),   // near-black — motion picture film can
            secondaryColor: Color(red: 0.85, green: 0.70, blue: 0.15), // gold — Kodak's motion-picture branding colour
            textColor: .white,
            synonyms: ["vision3 250d", "250d", "5207"]
            // Placed in the Kodak section (before Cinestill below) on purpose: "250d" contains "50d"
            // as a substring, which would otherwise incorrectly match CineStill 50D first.
        ),
        FilmTheme(
            name: "Vision3 500T", brand: "Kodak",
            primaryColor: Color(red: 0.08, green: 0.08, blue: 0.08),   // near-black — motion picture film can
            secondaryColor: Color(red: 0.65, green: 0.15, blue: 0.15), // red — tungsten-stock marking colour
            textColor: .white,
            synonyms: ["vision3 500t", "500t", "5219"]
        ),

        // Cinestill

        FilmTheme(
            name: "800T", brand: "CineStill",
            primaryColor: Color(red: 0.86, green: 0.20, blue: 0.18),   // red
            secondaryColor: Color(red: 0.10, green: 0.10, blue: 0.10),
            textColor: .white,
            synonyms: ["800t"]
        ),
        FilmTheme(
            name: "400D", brand: "CineStill",
            primaryColor: Color(red: 0.45, green: 0.25, blue: 0.68),   // purple
            secondaryColor: Color(red: 0.90, green: 0.85, blue: 0.95),
            textColor: .white,
            synonyms: ["400d"]
        ),
        FilmTheme(
            name: "50D", brand: "CineStill",
            primaryColor: Color(red: 0.12, green: 0.45, blue: 0.82),   // blue
            secondaryColor: Color(red: 0.85, green: 0.92, blue: 0.98),
            textColor: .white,
            synonyms: ["50d"]
        ),

        // Candido

        FilmTheme(
            name: "Candido 50", brand: "Candido",
            primaryColor: Color(red: 0.40, green: 0.20, blue: 0.55),   // purple — box body
            secondaryColor: Color(red: 0.22, green: 0.10, blue: 0.32), // darker purple shade
            textColor: .white,
            synonyms: ["candido 50"]
        ),
        FilmTheme(
            name: "Candido 200", brand: "Candido",
            primaryColor: Color(red: 0.65, green: 0.15, blue: 0.15),   // deep red/maroon — box body
            secondaryColor: Color(red: 0.40, green: 0.08, blue: 0.09), // darker red shade
            textColor: .white,
            synonyms: ["candido 200"]
        ),
        FilmTheme(
            name: "Candido 400", brand: "Candido",
            primaryColor: Color(red: 0.10, green: 0.30, blue: 0.20),   // dark forest green — box body
            secondaryColor: Color(red: 0.05, green: 0.18, blue: 0.12), // darker green shade
            textColor: .white,
            synonyms: ["candido 400"]
        ),
        FilmTheme(
            name: "Candido 800", brand: "Candido",
            primaryColor: Color(red: 0.15, green: 0.30, blue: 0.60),   // blue — box body
            secondaryColor: Color(red: 0.08, green: 0.16, blue: 0.35), // darker blue shade
            textColor: .white,
            synonyms: ["candido 800"]
        ),
        FilmTheme(
            name: "Candido", brand: "Candido",
            primaryColor: Color(red: 0.10, green: 0.30, blue: 0.20),
            secondaryColor: Color(red: 0.05, green: 0.18, blue: 0.12),
            textColor: .white,
            synonyms: ["candido"]
            //
        ),

        // Fujifilm

        FilmTheme(
            name: "Velvia 50", brand: "Fujifilm",
            primaryColor: Color(red: 0.05, green: 0.32, blue: 0.18),   // forest green — dominant box colour
            secondaryColor: Color(red: 0.06, green: 0.13, blue: 0.32), // dark navy blue — the diagonal band
            textColor: Color(red: 0.85, green: 0.68, blue: 0.25),      // gold — matches the "VELVIA" to match lettering on the box
            synonyms: ["velvia"]
        ),
        FilmTheme(
            name: "Provia 100F", brand: "Fujifilm",
            primaryColor: Color(red: 0.07, green: 0.42, blue: 0.22),   // green — dominant box colour
            secondaryColor: Color(red: 0.16, green: 0.10, blue: 0.36), // dark blue-purple — the diagonal band (distinguishes it from Velvia's navy)
            textColor: .white,
            synonyms: ["provia"]
        ),
        FilmTheme(
            name: "Superia X-TRA", brand: "Fujifilm",
            primaryColor: Color(red: 0.10, green: 0.45, blue: 0.25),
            secondaryColor: Color(red: 0.85, green: 0.80, blue: 0.20),
            textColor: .white,
            synonyms: ["superia", "fujicolor"]
        ),
        FilmTheme(
            name: "Natura 1600", brand: "Fujifilm",
            primaryColor: Color(red: 0.87, green: 0.93, blue: 0.85),   // pale mint —
            secondaryColor: Color(red: 0.98, green: 0.98, blue: 0.96), // near-white
            textColor: .black,
            synonyms: ["natura 1600", "natura"]
        ),


        FilmTheme(
            name: "Kentmere Pan 100", brand: "Kentmere",
            primaryColor: Color(red: 0.10, green: 0.10, blue: 0.10),   // near-black box
            secondaryColor: Color(red: 0.20, green: 0.55, blue: 0.30), // green speed band
            textColor: .white,
            synonyms: ["kentmere pan 100", "kentmere 100"]
        ),
        FilmTheme(
            name: "Kentmere Pan 400", brand: "Kentmere",
            primaryColor: Color(red: 0.10, green: 0.10, blue: 0.10),   // near-black box
            secondaryColor: Color(red: 0.75, green: 0.20, blue: 0.25), // red speed band
            textColor: .white,
            synonyms: ["kentmere pan 400", "kentmere 400"]
        ),
        FilmTheme(
            name: "Kentmere", brand: "Kentmere",
            primaryColor: Color(red: 0.10, green: 0.10, blue: 0.10),
            secondaryColor: Color(red: 0.75, green: 0.20, blue: 0.25),
            textColor: .white,
            synonyms: ["kentmere"]
            // Kentmere fallback, only reached if no ISO number is found above.
        ),
        FilmTheme(
            name: "Phoenix 200", brand: "Harman",
            primaryColor: Color(red: 0.90, green: 0.35, blue: 0.20),   // coral-orange — the box's fire/sunrise graphic
            secondaryColor: Color(red: 0.08, green: 0.08, blue: 0.10), // near-black background
            textColor: .white,
            synonyms: ["phoenix", "harman phoenix"]

        ),

        // Ilford

        FilmTheme(
            name: "HP5 Plus", brand: "Ilford",
            primaryColor: Color(red: 0.85, green: 0.40, blue: 0.10),   // orange
            secondaryColor: Color(red: 0.20, green: 0.20, blue: 0.20), // charcoal
            textColor: .white,
            synonyms: ["hp5", "ilford"]
        ),

        // Foma — standard packaging is red and white across the whole Fomapan range,
        // so all three speeds intentionally share one look here.

        FilmTheme(
            name: "Fomapan 100", brand: "Foma",
            primaryColor: Color(red: 0.75, green: 0.10, blue: 0.12),   // red — box body
            secondaryColor: Color(red: 0.95, green: 0.93, blue: 0.88), // white/cream
            textColor: .white,
            synonyms: ["fomapan 100", "fomapan100", "fomopan 100", "fomopan100"]
        ),
        FilmTheme(
            name: "Fomapan 200", brand: "Foma",
            primaryColor: Color(red: 0.75, green: 0.10, blue: 0.12),
            secondaryColor: Color(red: 0.95, green: 0.93, blue: 0.88),
            textColor: .white,
            synonyms: ["fomapan 200", "fomapan200", "fomopan 200", "fomopan200"]
        ),
        FilmTheme(
            name: "Fomapan 400", brand: "Foma",
            primaryColor: Color(red: 0.75, green: 0.10, blue: 0.12),
            secondaryColor: Color(red: 0.95, green: 0.93, blue: 0.88),
            textColor: .white,
            synonyms: ["fomapan 400", "fomapan400", "fomopan 400", "fomopan400"]
        ),
        FilmTheme(
            name: "Fomapan", brand: "Foma",
            primaryColor: Color(red: 0.75, green: 0.10, blue: 0.12),
            secondaryColor: Color(red: 0.95, green: 0.93, blue: 0.88),
            textColor: .white,
            synonyms: ["fomapan", "fomopan", "foma"]
            // Foma fallback (covers "fomopan" spelling too), only reached if no ISO number is found above.
        ),

        // Agfa

        FilmTheme(
            name: "Vista 200", brand: "Agfa",
            primaryColor: Color(red: 0.88, green: 0.25, blue: 0.10),   // orange-red — box body
            secondaryColor: Color(red: 0.10, green: 0.25, blue: 0.55), // deep blue — accent band
            textColor: .white,
            synonyms: ["agfa vista", "vista 200"]
        ),
        FilmTheme(
            name: "APX 400", brand: "Agfa",
            primaryColor: Color(red: 0.85, green: 0.30, blue: 0.08),   // orange-red
            secondaryColor: Color(red: 0.15, green: 0.15, blue: 0.15), // near-black
            textColor: .white,
            synonyms: ["apx 400", "apx400"]
        ),
        FilmTheme(
            name: "APX 100", brand: "Agfa",
            primaryColor: Color(red: 0.85, green: 0.30, blue: 0.08),
            secondaryColor: Color(red: 0.15, green: 0.15, blue: 0.15),
            textColor: .white,
            synonyms: ["apx 100", "apx100"]
        ),

        // Rollei

        FilmTheme(
            name: "Retro 400S", brand: "Rollei",
            primaryColor: Color(red: 0.55, green: 0.10, blue: 0.15),   // deep maroon
            secondaryColor: Color(red: 0.20, green: 0.20, blue: 0.20), // charcoal
            textColor: .white,
            synonyms: ["retro 400s", "retro400s"]
        ),
        FilmTheme(
            name: "RPX 100", brand: "Rollei",
            primaryColor: Color(red: 0.75, green: 0.75, blue: 0.75),   // light grey box
            secondaryColor: Color(red: 0.25, green: 0.55, blue: 0.30), // green speed band
            textColor: .black,
            synonyms: ["rpx 100", "rpx100"]
        ),

        // Lucky — Chinese budget black-and-white stock - need to add LuckyC200

        FilmTheme(
            name: "SHD 100", brand: "Lucky",
            primaryColor: Color(red: 0.75, green: 0.78, blue: 0.80),   // silver
            secondaryColor: Color(red: 0.10, green: 0.25, blue: 0.55), // deep blue
            textColor: .black,
            synonyms: ["lucky shd", "lucky film", "shd 100"]
        ),

        // Adox

        FilmTheme(
            name: "CHM 100 II", brand: "Adox",
            primaryColor: Color(red: 0.90, green: 0.45, blue: 0.10),   // Adox orange
            secondaryColor: Color(red: 0.95, green: 0.95, blue: 0.93), // white
            textColor: .black,
            synonyms: ["chm 100", "chm100", "adox chm"]
        ),
        FilmTheme(
            name: "Silvermax", brand: "Adox",
            primaryColor: Color(red: 0.90, green: 0.45, blue: 0.10),   // Adox orange
            secondaryColor: Color(red: 0.15, green: 0.15, blue: 0.15), // near-black
            textColor: .white,
            synonyms: ["silvermax"]
        ),

        // Lomography - LomoChrome experimental color-shifting stocks

        FilmTheme(
            name: "LomoChrome Purple", brand: "Lomography",
            primaryColor: Color(red: 0.55, green: 0.15, blue: 0.55),   // magenta-purple
            secondaryColor: Color(red: 0.25, green: 0.05, blue: 0.35), // deep violet
            textColor: .white,
            synonyms: ["lomochrome purple", "purple"]
        ),
        FilmTheme(
            name: "LomoChrome Turquoise", brand: "Lomography",
            primaryColor: Color(red: 0.10, green: 0.65, blue: 0.65),   // bright turquoise
            secondaryColor: Color(red: 0.05, green: 0.35, blue: 0.40), // deep teal
            textColor: .white,
            synonyms: ["lomochrome turquoise", "turquoise"]
        ),
        FilmTheme(
            name: "LomoChrome Metropolis", brand: "Lomography",
            primaryColor: Color(red: 0.35, green: 0.35, blue: 0.38),   // muted graphite grey
            secondaryColor: Color(red: 0.85, green: 0.55, blue: 0.25), // warm amber
            textColor: .white,
            synonyms: ["lomochrome metropolis", "metropolis"]
        ),


        FilmTheme(
            name: "Tri-X 400", brand: "Kodak",
            primaryColor: Color(red: 0.11, green: 0.32, blue: 0.18),   // forest green — top band of the box
            secondaryColor: Color(red: 0.96, green: 0.80, blue: 0.14), // gold-yellow — bottom band of the box
            textColor: .white,
            synonyms: ["tri-x", "trix"]
        )
    ]

    static func theme(for filmStock: String) -> FilmTheme? {
        // Returns an optional now, rather than always a color, since we need the whole theme
        // (both colors + text color) wherever this is used, not just one value.

        let name = filmStock.lowercased()

        for theme in all {
            // "all" is already ordered specific-before-generic (Portra 800/400 before plain Portra),
            // so the first match found is always the most precise one available.

            for synonym in theme.synonyms {
                if name.contains(synonym) {
                    return theme
                }
            }
        }
        return nil
        // No match — caller decides the fallback the appearance instead of guessing (I need to grow the catalog of colour themes)
    }

    static func color(for filmStock: String) -> Color {
        // Kept for anywhere, I only need a single accent color (like .tint), not a full gradient.
        theme(for: filmStock)?.primaryColor ?? .accentColor
    }

    static func gradient(for filmStock: String) -> LinearGradient {
        guard let theme = theme(for: filmStock) else {
            return LinearGradient(colors: [.gray.opacity(0.3), .gray.opacity(0.15)], startPoint: .topLeading, endPoint: .bottomTrailing)
            // Neutral grey gradient fallback for unrecognised stocks, so the UI never looks broken.
        }
        return LinearGradient(
            colors: [theme.primaryColor, theme.secondaryColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static func textColor(for filmStock: String) -> Color {
        theme(for: filmStock)?.textColor ?? .primary
    }
}
