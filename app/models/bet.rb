class Bet < ApplicationRecord
  POSITIONS = ["1", "2", "3"]
  RIDERS = ["ALAPHILIPPE Julian","ARANBURU Alex","ARCAS Jorge","ARMIRAIL Bruno","ASGREEN Kasper","BAKELANTS Jan","BALLERINI Davide","BARBERO Carlos","BARGUIL Warren","BARTHE Cyril","BENNETT Sean","BENOOT Tiesj","BERNARD Julien","BILBAO Pello","BISSEGGER Stefan","BJERG Mikkel","BOASSON HAGEN Edvald","BOIVIN Guillaume","BOL Cees","BONNAMOUR Franck","BOUHANNI Nacer","BUCHMANN Emanuel","CABOT Jérémy","CAMPENAERTS Victor","CARAPAZ Richard","CASTROVIEJO Jonathan","CATTANEO Mattia","CAVENDISH Mark","CHAVES Esteban","CHEVALIER Maxime","CLARKE Simon","COLBRELLI Sonny","COQUARD Bryan","CORT Magnus","COSNEFROY Benoît","COSTA Rui","DE BOD Stefan","DE BUYST Jasper","DE GENDT Thomas","DE LA PARTE Víctor","DECLERCQ Tim","DELAPLACE Anthony","DÉMARE Arnaud","DEVENYNS Dries","DILLIER Silvan","DLAMINI Nic","DONOVAN Mark","DOUBEY Fabien","DURBRIDGE Luke","EEKHOFF Nils","ELISSONDE Kenny","ERVITI Imanol","EWAN Caleb","FERNÁNDEZ Rubén","FORMOLO Davide","FRAILE Omar","FROOME Chris","FUGLSANG Jakob","GARCÍA CORTINA Iván","GAUDU David","GAUTIER Cyril","GEOGHEGAN HART Tao","GESBERT Élie","GESCHKE Simon","GESINK Robert","GILBERT Philippe","GODON Dorian","GOGL Michael","GOLDSTEIN Omer","GREIPEL André","GRUZDEV Dmitriy","GUARNIERI Jacopo","GUERREIRO Ruben","HAIG Jack","HALLER Marco","HAMILTON Lucas","HENAO Sergio","HERRADA Jesús","HIGUITA Sergio","HIRSCHI Marc","HOLLENSTEIN Reto","HOULE Hugo","IZAGIRRE Ion","JANSEN Amund Grøndahl","JUUL-JENSEN Christopher","KELDERMAN Wilco","KLUGE Roger","KOCH Jonas","KONOVALOVAS Ignatas","KONRAD Patrick","KRAGH ANDERSEN Søren","KRUIJSWIJK Steven","KÜNG Stefan","KUSS Sepp","KWIATKOWSKI Michał","LAENGEN Vegard Stake","LAPORTE Christophe","LATOUR Pierre","LEMOINE Cyril","LÓPEZ Miguel Ángel","LUTSENKO Alexey","MADOUAS Valentin","MAJKA Rafał","MARTIN Tony","MARTIN Guillaume","MARTIN Dan","MAS Enric","MATTHEWS Michael","MCLAY Daniel","MCNULTY Brandon","MEINTJES Louis","MERLIER Tim","MEURISSE Xandro","MEZGEC Luka","MOHORIČ Matej","MOLLEMA Bauke","MØRKØV Michael","NAESEN Oliver","NIBALI Vincenzo","NIEUWENHUIS Joris","O'CONNOR Ben","OSS Daniel","PACHER Quentin","PARET-PEINTRE Aurélien","PEDERSEN Casper","PEDERSEN Mads","PEREZ Anthony","PÉRICHON Pierre-Luc","PETERS Nans","PHILIPSEN Jasper","POELS Wout","POGAČAR Tadej","POLITT Nils","PORTE Richie","PÖSTLBERGER Lukas","POWLESS Neilson","QUINTANA Nairo","RICKAERT Jonas","RODRÍGUEZ Cristián","ROGLIČ Primož","ROLLAND Pierre","ROTA Lorenzo","ROWE Luke","RUSSO Clément","RUTSCH Jonas","SAGAN Peter","SBARAGLI Kristian","SCHÄR Michael","SCHELLING Ide","SCOTSON Miles","SIMON Julien","SKUJIŅŠ Toms","SOLER Marc","STUYVEN Jasper","SÜTTERLIN Jasha","SWEENY Harry","SWIFT Connor","TEUNISSEN Mike","TEUNS Dylan","THEUNS Edward","THOMAS Geraint","TURGIS Anthony","URÁN Rigoberto","VAKOČ Petr","VALGREN Michael","VALVERDE Alejandro","VAN AERT Wout","VAN AVERMAET Greg","VAN BAARLE Dylan","VAN DER POEL Mathieu","VAN DER SANDE Tosh","VAN MOER Brent","VAN POPPEL Boy","VAN POPPEL Danny","VERONA Carlos","VINGEGAARD Jonas","VLIEGEN Loïc","WALLAYS Jelle","WALSCHEID Max","WOODS Michael","WRIGHT Fred","YATES Simon","ZABEL Rick","ZIMMERMANN Georg"]

  belongs_to :user
  belongs_to :stage
  belongs_to :rider

  validates :user_id, uniqueness: { scope: [:stage_id, :position],
    message: "Vous ne pouvez parier qu'une seule fois" }

  validates :user_id, uniqueness: { scope: [:stage_id, :rider_id],
    message: "Vous ne pouvez choisir un coureur qu'une seule fois pour la même étape"
  }

  # validates :user_id, length: { maximum: 3}, { scope: :stage_id,
  #   message: "Vous ne pouvez parier que 3 fois pour une étape"
  # }

end
