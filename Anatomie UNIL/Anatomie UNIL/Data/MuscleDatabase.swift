//
//  MuscleDatabase.swift
//  Anatomie UNIL
//
//  Created by Assistant on 22.09.2025.
//

import Foundation

struct MuscleDatabase {

    // MARK: - Upper Limb Muscles

    static let shoulderAnteriorMuscles = [
        ("muscle grand pectoral", "Clavicule(1/2 méd), sternum, 4 à 6 cartilages costaux, gaine du muscle droit de l'abdomen", "Crète du tubercule majeur de l'humérus", "N. pectoraux", "Artère thoraco-acromiale"),
        ("muscle petit pectoral", "Côtes 3-5", "Processus coracoïde", "N. pectoraux", "Artère thoraco-acromiale, artère deltoïdienne"),
        ("muscle subclavier", "Cartilage 1ère côte", "Face inférieure de la clavicule", "N. subclavier", "Artère thoraco-acromiale"),
        ("muscle sterno-cléido-mastoïdien", "Sternum et clavicule", "Processus mastoïde et ligne nuchale supérieur", "N. accessoire et plexus cervical", "Artère supra-scapulaire"),
        ("muscle deltoïde", "Clavicule (tier latéral), acromion et épine de la scapula", "Tubérosité deltoïdienne de l'humérus", "N. axillaire", "Artère thoraco-acromiale, artère profonde du bras")
    ]

    static let shoulderPosteriorMuscles = [
        ("muscle supra-épineux", "Fosse supra-épineuse", "Facette supérieurs du tubercule majeur de l'humérus", "N. supra-scapulaire", "Artère supra-scapulaire"),
        ("muscle infra-épineux", "Fosse infra-épineuse", "Facette moyenne du tubercule majeur de l'humérus", "N. supra-scapulaire", "Artère supra-scapulaire et circonflexe scapulaire"),
        ("muscle petit rond", "Bord latéral supérieur de la scapula", "Facette inférieure du tubercule majeur de l'humérus", "N. axillaire", "Artère circonflexe de la scapula et artère circonflexe postérieure de l'humérus"),
        ("muscle grand rond", "Bord inférieur et latéral de la scapula", "Crète du tubercule mineur de l'humérus", "N. subscapulaire", "Artère circonflexe postérieure de l'humérus"),
        ("muscle subscapulaire", "Fosse subscapulaire", "Tubercule mineur de l'humérus", "N. subscapulaire", "Artère subscapulaire, artère axiliaire, artère suprascapulaire"),
        ("muscle grand dorsal", "Processus épineux T7 à L5, aponévrose lombaire, crète iliaque partie postérieure, angle inférieur de la scapula, sacrum, côtes 10-12", "Crète du tubercule mineur de l'humérus", "N. thoraco dorsal", "Artère thoraco-dorsale"),
        ("muscle dentelé antérieur", "9-10 digitations sur les côtes 1-9", "Angle supérieur, bord médial antérieur, angle inférieur de la scapula", "N. thoracique long", "Error"),
        ("muscle petit rhomboïde", "Processus épineux C6 et C7", "Bord médial de la scapula, au-dessus de l'épine scapulaire", "N. dorsal de la scapula", "Artère scapulaire dorsale"),
        ("muscle grand rhomboïde", "Processus épineux T1 à T4", "Bord médial de la scapula au-dessous de l'épine scapulaire", "N. dorsal de la scapula", "Error"),
        ("muscle élévateur de la scapula", "Processus transverse, C1-C4", "Angle supérieur de la scapula", "N. dorsal de la scapula", "Artère cervicale transverse"),
        ("muscle trapèze", "Protubérance occipitale ext. ligne nuchale supérieur, ligament nuchal supérieur, processus épineux C7-T12", "Clavicule (1/3 latéral), acromion et épine de la scapula", "N. accessoire et plexus cervical", "Artère cervicale, artère occipitale")
    ]

    static let armMuscles = [
        ("muscle biceps brachial chef long", "Tubercule supra-glénoïdal", "Tubérosité du radius et expansion aponévrotique bicipitale", "N. musculo-cutané", "Artère brachiale"),
        ("muscle biceps brachial chef court", "Processus coracoïde", "Tubérosité du radius et expansion aponévrotique bicipitale", "N. musculo-cutané", "Artère brachiale"),
        ("muscle coraco-brachial", "Processus coracoïde", "1/3 moyen face médiale de l'humérus", "N. musculo-cutané", "Artère axiliaire, artère circonflexe"),
        ("muscle brachial", "2/3 inférieur face antérieure de l'humérus", "tubérosité de l'ulna", "N. musculo-cutané", "Artère brachiale"),
        ("muscle triceps brachial chef long", "Tubercule infra-glénoïdal", "Olécrâne de l'ulna", "N. radial", "Artère profonde du bras, artère supérieure ulnaire, artère circonflexe latérale postérieure"),
        ("muscle triceps brachial chef médial (vaste interne)", "face postérieur de l'humérus côté médial et distal du sillon du n. radial", "Olécrâne de l'ulna", "N. radial", "Artère profonde du bras, artère supérieure ulnaire, artère circonflexe latérale postérieure"),
        ("muscle triceps brachial chef latéral (vaste externe)", "face postérieure de l'humérus côté latéral et proximal du sillon du n.radial", "Olécrâne de l'ulna", "N. radial", "Artère profonde du bras, artère supérieure ulnaire, artère circonflexe latérale postérieure"),
        ("muscle anconé", "Epicondyle latéral de l'humérus", "Tier supérieur du bord postérieur de l'ulna", "N. radial", "Artère interosseuse récurrente")
    ]

    static let forearmAnteriorMuscles = [
        ("muscle rond pronateur", "Epicondyle médial de l'humérus et processus coronoïde de l'ulna", "Milieu, face latérale du radius", "N. médian", "Artère ulnaire, artère récurrente ulnaire antérieure"),
        ("muscle fléchisseur radial du carpe", "Epicondyle médial de l'humérus", "Base 2e et 3e métacarpiens (palmaire)", "N. médian", "Artère récurrente ulnaire et artère postérieure radiale"),
        ("muscle long palmaire", "Epicondyle médial de l'humérus", "Aponévrose palmaire", "N. médian", ""),
        ("muscle fléchisseur ulnaire du carpe", "Epicondyle médial, olécrâne, et 2/3 postérieur proximal de l'ulna", "Os pisiforme, os hamatum, 5e métacarpien", "N. ulnaire", "Artère récurrente ulnaire postérieure et inférieure, artère ulnaire"),
        ("muscle fléchisseur superficiel des doigts", "Epicondyle médial de l'humérus, processus coronoïde de l'ulna, face antérieure du radius", "Phalanges moyennees, doigts 2-5", "N. médian", "Artère ulnaire, artère radiale, artère récurrente ulnaire"),
        ("muscle fléchisseur profond des doigts", "3/4 prox. de face antérieure et médial de l'ulna, membrane interosseuse", "Base des phalanges distales des doigts 2-5", "N. médian & ulnaire", "Artère ulnaire, artère interosseuse antérieure"),
        ("muscle long fléchisseur du pouce", "Face antérieure du radius au-dessous de la tubérosité radiale, membrane interosseuse", "Base de la phalange distale du pouce", "N. médian", "Artère interosseuse antérieure"),
        ("muscle carré pronateur", "1/4 distal de face antérieure de l'ulna", "1/4 distal de face antérieure du radius", "N. médian", "Artère interosseure antérieure")
    ]

    static let forearmPosteriorMuscles = [
        ("muscle brachio-radial", "Septum intermusculaire latéral et bord latéral de l'humérus", "Processus styloïde du radius", "N. radial", "Artère radiale récurrente, artère collatérale radiale, artère radiale"),
        ("muscle long extenseur radial du carpe", "septum intermusculaire latéral et bord latéral de l'humérus", "Base 2e métacarpien postérieur", "N. radial", "Artère radiale"),
        ("muscle court extenseur radial du carpe", "Epicondyle latéral de l'humérus", "Base 3e métacarpien postérieur", "N. radial", "Artère radiale"),
        ("muscle extenseur des doigts", "Epicondyle latéral de l'humérus", "Aponévrose dorsales, phalanges des doigts 2-5", "N. radial", "Artère interosseuse postérieure"),
        ("muscle extenseur propre du 5e doigt", "Epicondyle latéral de l'humérus", "Aponévrose dorsale du 5e doigt", "N. radial", "Artère interosseure antérieure"),
        ("muscle extenseur ulnaire du carpe", "Epicondyle latéral de l'humérus, l'ulna, et ligament collatéral radial", "Base du 5e métacarpien, face postérieure", "N. radial", "Artère récurrente radiale, artère interosseuse postérieure"),
        ("muscle supinateur", "Crête ulnaire du muscle supinateur, épicondyle latéral de l'humérus, ligament collatéral radial", "Face latérale et bord antérieur du radius", "N. radial", "Artère interosseuse récurrente"),
        ("muscle long abducteur, du pouce", "Face postérieure membrane interosseuse, faces adjacentes de l'ulna et du radius", "Base du 1er métacarpien", "N. radial", "Error"),
        ("muscle court extenseur du pouce", "Face postérieure du radius et de la membane interosseuse", "Base phalange proximale du pouce", "N. radial", "Artère interosseuse postérieure et antérieure"),
        ("muscle long extenseur du pouce", "Face postérieure de l'ulna et de la membrane interosseuse", "Base phalange distale du pouce", "N. radial", "Artère interosseuse postérieure et antérieure"),
        ("muscle extenseur de l'index", "Tiers inférieur de face postérieur de l'ulna, membrane interosseuse", "Aponévrose dorsale de l'index", "N. radial", "Artère interosseuse postérieure et antérieure")
    ]

    static let handMuscles = [
        ("muscle court palmaire", "Aponévrose palmaire", "Peau du bord ulnaire de la main", "N. ulnaire", "Artère ulnaire, artère palmaire superficielle"),
        ("muscle abducteur du 5e doigt", "Os pisiforme, ligament piso-hamatum et rétinaculum des fléchisseurs", "Base phalange prox. du 5e doigt et aponévrose dorsale", "N. ulnaire", "Artère ulnaire"),
        ("muscle court fléchisseur du 5e doigt", "Rétinaculum des fléchisseurs, crochet (hamulus) de l'hamatum", "Base phalange proximal du 5e doigt, avec m. abd. du 5e doigt", "N. ulnaire", "Artère ulnaire"),
        ("muscle opposant du 5e doigt", "Rétinaculum des fléchisseurs et hamulus de l'hamatum", "Tête et corps, bord ulnaire, du 5e métacarpien", "N. ulnaire", "Artère ulnaire"),
        ("muscle court abducteur du pouce", "Rétinaculum des fléchisseurs et tubercule du scaphoïde", "Sésamoïde latéral et phalange prox. du pouce", "N. ulnaire", "Branche palmaire superficielle de l'artère radiale"),
        ("muscle court fléchisseur du pouce chef superficiel", "Rétinaculum des fléchisseurs", "Sésamoïde latéral et bord radial", "N. médian", "Branche palmaire superficielle de l'artère radiale"),
        ("muscle court fléchisseur du pouce chef profond", "Trapèze, trapézoïde, capitatum, base 1er métacarpien", "Phalange prox. du pouce", "N. ulnaire", "Branche palmaire superficielle de l'artère radiale"),
        ("muscle adducteur du pouce chef transverse", "Face antérieure 3e métacarpien", "Sésamoïde médial et bord ulnaire", "N. ulnaire", "Arcade palmaire profonde"),
        ("muscle adducteur du pouce chef oblique", "Trapézoïde et capitatum", "Phalange proximale du pouce", "N. ulnaire", "Arcade palmaire profonde"),
        ("muscle opposant du pouce", "Tubercule du trapèze, rétinaculum des fléchisseurs", "Bord latéral du 1er métacarpien", "N. ulnaire", "Branche palmaire superficielle de l'artère radiale"),
        ("muscle interosseux palmaires", "Bases des métacarpiens 2, 4, 5", "Aponévrose dorsale doigts 2, 4, 5", "N. ulnaire", "Arcade palmaire profonde, artères palmaires métacarpiennes, artère radiale de l'index"),
        ("muscle interosseux dorsaux", "2 chefs sur métacarpiens adjacents 1 à 5", "Aponévroses dorsales doigts 2 à 4", "N. ulnaire", "Arcade palmaire profonde, artères palmaires et dorsales métacarpiennes, artère radiale de l'index"),
        ("muscles lombricaux", "Tendons du m. fléchisseur profond des doigts", "Face radiale aponévroses dorsales et capsules art. métacarpo-phalangiennes des doigts 2 à 5", "N. ulnaire", "Artères métacarpiennes dorsales, artères digitales dorsales")
    ]

    // MARK: - Lower Limb Muscles

    static let hipMuscles = [
        ("muscle ilio-psoas iliaque", "Fosse iliaque", "Petit trochanter", "Plexus lombaire et n. fémoral (crural)", "Artère ilio-lombaire, branche du tronc postérieur de l'artère iliaque interne"),
        ("muscle ilio-psoas psoas", "Corps et disques intervertébrals L1-L4, processus costiforme L1-L5", "Petit trochanter", "Plexus lombaire et n. fémoral (crural)", "Artère ilio-lombaire, branche du tronc postérieur de l'artère iliaque interne"),
        ("muscle carré des lombes", "Crête iliaque", "12e côte processus costiforme L1-L4", "N. subcostal et plexus lombaire", "Veines subcostales"),
        ("muscle tenseur du fascia lata", "Côté latéral de l'épine iliaque antéro-supérieure", "Tractus ilio-tibial, latéral à la tubérosité externe du tibia", "N. glutéal supérieur", "Artère glutéale supérieure, artère circonflexe latérale"),
        ("muscle grand fessier", "Face postérieure et ext. de l'ilium, sacrum, coccyx, lig. sacro-tubéral profond : aile iliaque", "Tractus ilio-tibial, tubérosité glutéale du fémur, septum intermusculaire", "N. glutéal inférieur", "Artères glutéales inférieures et supérieures"),
        ("muscle moyen fessier", "Face ext. de l'ilium, entre lignes glutéales postérieures et antérieures", "Grand trochanter", "N. glutéal supérieur", "Artère glutéale supérieure"),
        ("muscle petit fessier", "Face ext. de l'ilium, entre lignes glutéales antérieures et inférieures", "Grand trochanter", "N. glutéal supérieur", "Artère glutéale supérieure"),
        ("muscle piriforme", "Plusieurs digitations sur la face pelvienne du sacrum en dehors des trous sacrés antérieurs et bord de la grande échancrure sciatique", "Face médiale de la pointe du grand trochanter", "Plexus sacré", "Artères glutéales"),
        ("muscle obturateur interne", "Face int. de la membrane obturatrice et cadre osseux voisin de l'os coxal", "Fosse trochantérique du fémur", "N. du m. obturateur interne", "Artères glutéales inférieures, artère honteuse interne"),
        ("muscle jumeau supérieur", "Epine sciatique", "Tendon du m. obturateur inférieur", "N. glutéal inférieur et plexus sacré", "Artère glutéale inférieure"),
        ("muscle jumeau inférieur", "Tubérosité ischiatique", "Fosse trochantérique du fémur", "N. glutéal inférieur et plexus sacré", "Artère glutéale inférieure"),
        ("muscle carré fémoral", "Tubérosité ischiatique", "Crête intertrochantérique", "N. glutéal inférieur et plexus sacré", "Artère circonflexe, artère glutéale"),
        ("muscle obturateur externe", "Face ext. de la membrane obturatrice et cadre osseux voisin de l'os coxal", "Fosse trochantérique du fémur", "N. obturateur", "Artère obturatrice")
    ]

    static let thighMuscles = [
        ("muscle sartorius (couturier)", "Epine iliaque antéro supérieure", "Face médiale de la tubérosité tibiale (patte d'oie)", "N. fémoral (crural)", "Artère fémorale"),
        ("muscle quadriceps droit fémoral", "Epine iliaque antéro-inférieure, bord supérieur de l'acétabulum", "Tendon du quadriceps, sur la patella et par le lig. patellaire sur la tubérosité tibiale", "N. fémoral (crural)", "Artère fémorale"),
        ("muscle quadriceps vaste intermédiaire", "Face antérieure du fémur", "Tendon du quadriceps, sur la patella et par le lig. patellaire sur la tubérosité tibiale", "N. fémoral (crural)", "Artère fémorale"),
        ("muscle quadriceps vaste médial", "Lèvre médial de la ligne âpre du fémur partie dist. ligne intertrochantérique", "Tendon du quadriceps, sur la patella et par le lig. patellaire sur la tubérosité tibiale", "N. fémoral (crural)", "Artère fémorale, artère fémorale profonde, artère poplitée"),
        ("muscle quadriceps vaste latéral", "Face latérale du grand trochanter et lèvre latéral de la ligne âpre du fémur", "Tendon du quadriceps, sur la patella et par le lig. patellaire sur la tubérosité tibiale", "N. fémoral (crural)", "Artère circonflexe latérale"),
        ("muscle pectiné", "Pecten du pubis", "Ligne pectinéale au-dessous du petit trochanter", "N. fémoral (crural), et branche antérieure du n. obturateur", "Artère circonflexe médiale, artère obturatrice"),
        ("muscle court petit adducteur (cuisse)", "Moitié inférieur de la branche descendante du pubis", "Tiers supérieur de la lèvre médial de la ligne âpre du fémur", "Branche antérieure du n. obturateur", "Artère obturatrice"),
        ("muscle long moyen adducteur (cuisse)", "inférieur près de la symphyse pubienne", "Tiers moyen de la lèvre médial de la ligne âpre du fémur", "Branche antérieure du n. obturateur", "Artère obturatrice"),
        ("muscle grand adducteur faisceau supérieur (cuisse)", "Branche de l'ischion", "Lèvre médial de la ligne âpre du fémur", "N. obturateur", ""),
        ("muscle grand adducteur faisceau moyen (cuisse)", "Branche de l'ischion", "Lèvre médial de la ligne âpre du fémur", "N. obturateur", "Artère circonflexe médiale, artères perforantes, artère obturatrice, branche de l'artère poplitée"),
        ("muscle grand adducteur faisceau inférieur (cuisse)", "Branche de l'ischion jusqu'à la tubérosité ischiatique", "Tubercule du grand adducteur sur l'épicondyle médial du fémur", "N. tibial", "Artère circonflexe médiale, artères perforantes, artère obturatrice, branche de l'artère poplitée"),
        ("muscle gracile (droit interne)", "Branche descendante du pubis médial au m. grand adducteur", "Face médiale de la tubérosité du tibia (patte d'oie)", "Branche antérieure du n. obturateur", "Artère obturatrice, artère circonflexe médiale"),
        ("muscle biceps fémoral chef long", "Tubérosité ischiatique", "Tête de la fibula", "N. sciatique (n. tibial; n. sciatique poplité int.)", "Branches perforantes de l'artère fémorale (profonde), branche de l'artère poplitée"),
        ("muscle biceps fémoral chef court", "Tiers moyen de la lèvre latéral de la ligne âpre du fémur et de la cloison intermusculaire latéral de la cuisse", "Tête de la fibula", "N. sciatique (n. fibulaire commun, n. sciatique poplité ext.", "Branches perforantes de l'artère fémorale (profonde), branche de l'artère poplitée"),
        ("muscle semi-tendineux", "Tubérosité ischiatique", "Face médiale de la tubérosité du tibia (patte d'oie)", "N. tibial", "Branches perforantes de l'artère fémorale profonde, branche de l'artère poplitée"),
        ("muscle semi-membraneux", "Tubérosité ischiatique", "Condyle médial du tibia, et ligament poplité oblique", "N. tibial", "Branches perforantes de l'artère fémorale profonde, branche de l'artère poplitée")
    ]

    static let legMuscles = [
        ("muscle tibial antérieur", "Face latérale du tibia, memb. inteross. fascia crural", "Face plantaire, cunéiforme médial, et métatarsien 1", "N. fibulaire profond", "Artère tibiale antérieure"),
        ("muscle long extenseur des orteils", "Condyle latéral du tibia, tête et crête de la fibula, memb. inteross.", "Divisé en quatre tendons au niveau de la cheville, aponévrose dorsale des orteils 2-5", "N. fibulaire profond", "Artère dorsale du pied, artère tibiale antérieure"),
        ("muscle 3e fibulaire (péronier antérieur)", "Division du muscle long extenseur", "Base du métatarsien 5", "N. fibulaire profond", "Artère tibiale antérieure"),
        ("muscle long extenseur de l'hallux", "Face médiale de la fibula (péroné) et memb. inteross.", "Phalange distale de l'hallux", "N. fibulaire profond", "Artère dorsale du pied, artère tibiale antérieure"),
        ("muscle long fibulaire", "Fibula et fascia crural", "Traverse la plante du pied, tubercule du métatarsien 1 et cunéiforme médial (1er)", "N. fibulaire superficiel", "Artère fibulaire, artère tibiale antérieure"),
        ("muscle court fibulaire", "2/3 dist. face latérale de la fibula", "Tubercule du métatarsien 5", "N. fibulaire superficiel", "Artère fibulaire"),
        ("muscle triceps sural - gastrocnémien chef médial", "Côté proximal du condyle fémoral médial", "Tendon calcanéen (d'Achille), tubérosité postérieur du calcanéus", "N. tibial", "Artère poplitée"),
        ("muscle triceps sural - gastrocnémien chef latéral", "Côté proximal du condyle fémoral latéral", "Tendon calcanéen (d'Achille), tubérosité postérieur du calcanéus", "N. tibial", "Artère poplitée"),
        ("muscle triceps sural - soléaire", "Extrémité proximale de la fibula et du tibia", "Tendon calcanéen (d'Achille), tubérosité postérieur du calcanéus", "N. tibial", "Artère tibiale postérieure, artère fibulaire, artère surale"),
        ("muscle plantaire (grêle)", "Au-dessus du condyle fémoral latéral avec le m. grastrocnémien latéral", "Tendon calcanéen (d'Achille), tubérosité postérieur du calcanéus", "N. tibial", "Artère poplitée"),
        ("muscle poplité", "Condyle latéral du fémur", "Face postérieure du tibia", "N. tibial", "Branche de l'artère tibiale postérieure, branche de l'artère poplitée"),
        ("muscle tibial postérieur", "Memb. interosseuses et zones adjacentes du tibia et de la fibula", "Os naviculaire, cunéiformes, cuboïde et métatarsiens 2-4", "N. tibial", "Artère tibiale postérieure"),
        ("muscle long fléchisseur des orteils", "Face postérieure du tibia", "Quatre tendons terminaux, sur les phalanges distales des orteils 2-5", "N. tibial", "Artère tibiale postérieure"),
        ("muscle long fléchisseur de l'hallux", "2/3 inférieur face postérieure de la fibula, memb. interrosseuse et septum intermusculaire latéral", "Base de la phalange distale de l'hallux", "N. tibial", "Artère tibiale postérieure")
    ]

    static let footMuscles = [
        ("muscle court extenseur des orteils", "Calcanéus (face dorsale)", "Aponévroses dorsales des orteils 2-4", "N. fibulaire profond", ""),
        ("muscle court extenseur de l'hallux", "Calcanéus (face dorsale)", "Face dorsale de la phalange proximale de l'hallux", "N. fibulaire profond", ""),
        ("muscle abducteur de l'hallux", "Processus médial de la tubérosité du calcanéus", "Sésamoïde médial et base de la phalange prox. de l'hallux", "N. plantaire médial", "Artère plantaire"),
        ("muscle court fléchisseur de l'hallux", "Os cuboïde et lig. plantaire", "Deux chefs, sur les deux sésamoïdes et la base de la phalange prox. de l'hallux", "N. plantaire médial", "Artères plantaires"),
        ("muscle adducteur de l'hallux chef oblique", "Base des métatarsiens 2-4, du 3e cunéiforme (latéral) et du cuboïde", "Os sésamoïde latéral & phalange prox. de l'hallux", "N. plantaire latéral", "Artères plantaires"),
        ("muscle adducteur de l'hallux chef transverse", "capsule art. métatarsophalangiennes des orteils 3-5", "Os sésamoïde latéral", "N. plantaire latéral", "Artères plantaires"),
        ("muscle abducteur du 5e orteil", "Tubérosité ext. du calcanéus et aponévrose plantaire", "Côté latéral base phalange prox. du petit orteil", "N. plantaire latéral", ""),
        ("muscle court fléchisseur du 5e orteil", "Base du 5e métatarsien", "Base phalange prox. du petit orteil", "N. plantaire latéral", "Artère plantaire"),
        ("muscle opposant du 5e orteil", "Lig. plantaire long et gaine du m. long fibulaire", "Bord latéral du 5e métatarsien", "N. plantaire latéral", "Artère plantaire"),
        ("muscle court fléchisseur des orteils", "Tubérosité postérieur du calcanéus et aponévrose plantaire", "Par des tendons divisés à la phalange moyenne des orteils 2-5", "N. plantaire latéral", "Artère plantaire médiale"),
        ("muscle carré plantaire", "Bord médial et latéral du calcanéus", "Bord latéral du tendon du m. long fléchisseur des orteils", "N. plantaire latéral", "Artères plantaires"),
        ("muscles lombricaux", "Côté médial des tendons du m. long fléchisseur des orteils", "Bord. méd des phalanges prox. des orteils 2 à 5", "N. plantaire latéral", "Artères plantaires"),
        ("muscles interosseux plantaires", "Par 1 seul chef sur les métatarsiens 2-5", "Base des phalanges prox. des orteils 3-5", "N. plantaire latéral", "Arcade plantaire"),
        ("muscles interosseux dorsaux", "Par 2 chefs sur les métatarsiens adjacents 1-5", "Aponévrose dorsale des phalanges prox. des orteils 2 à 4", "N. plantaire latéral", "Arcade plantaire")
    ]

    // MARK: - Trunk Muscles

    static let neckAndNapeMuscles = [
        ("muscle trapèze", "Processus épineux C7-T12, ligament nuchale, protubérance occipitale ext., ligne nuchale supérieur", "Epine de la scapula, acromion, clavicule (1/3 latéral)", "N. accessoire (XI) et plexus cervical", ""),
        ("muscle sterno-cléido-mastoïdien", "Sternum et clavicule", "Processus mastoïde, ligne nuchale supérieure de l'os occipital", "N. accessoire (XI) et plexus cervical", ""),
        ("muscle élévateur de la scapula", "Tubercule postérieur des processus transverses de C1-C4", "Angle supérieur de la scapula", "N. dorsal de la scapula", ""),
        ("muscle splénius de la tête", "Processus épineux C4-T3", "Moitié latérale de la ligne nuchale supérieure, processus mastoïde de l'os temporal", "Branche postérieure des nn. spinaux", ""),
        ("muscle splénius du cou", "Processus épineux T3-T5", "Tubercule postérieur des processuss transverses de C1 et C2", "Branche postérieure des nn. spinaux", ""),
        ("muscle semi-épineux de la tête", "Processus transverses C4-T6", "Entre les lignes nuchales supérieures et inférieures de l'os occipital", "Branche postérieure des nn. spinaux", ""),
        ("muscle grand droit postérieur de la tête", "Processus épineux de l'axis (C2)", "Tiers moyen de la ligne nuchale inférieur", "Branche postérieure du n. C1 (suboccipital)", ""),
        ("muscle petit droit postérieure de la tête", "Tubercule postérieur de l'atlas (C1)", "Tiers médial de la ligne nuchale inférieure", "Branche postérieure du n. C1 (suboccipital)", ""),
        ("muscle oblique supérieur de la tête", "Processus transverse de l'atlas", "Aire au-dessus du muscle grand droit postérieur de la tête", "Branche postérieure du n. C1 (suboccipital)", ""),
        ("muscle oblique inférieur de la tête", "Processus épineux de l'axis", "Processus transverse de l'atlas", "Branche postérieure du n. C1 (suboccipital)", "")
    ]

    static let backMuscles = [
        ("muscle grand dorsal", "Processus épineux T7-L5, aponévrose lombaire, crête iliaque, sacrum", "Crête du tubercule mineur de l'humérus", "N. thoraco-dorsal", ""),
        ("muscle grand rhomboïde", "Processus épineux T1-T4", "Bord médial de la scapula, au-dessous de l'épine", "N. dorsal de la scapula", ""),
        ("muscle petit rhomboïde", "Processus épineux C6-C7", "Bord médial de la scapula, au-dessus de l'épine", "N. dorsal de la scapula", ""),
        ("muscle dentelé postérieur et supérieur", "Processus épineux C6-T2", "De la 2e à la 6e côte", "N. intercostaux", ""),
        ("muscle dentelé postérieur et inférieur", "Processus épineux T11-L2", "De la 9e à la 12e côte", "N. intercostaux", ""),
        ("muscle ilio-costal du cou", "Angle des côtes supérieures", "Processus transverses C3-C5", "Branche postérieure nn. spinaux", ""),
        ("muscle ilio-costal du thorax", "angle médial des 6 côtes inférieures", "Les 6 côtes supérieures", "Branche postérieure nn. spinaux", ""),
        ("muscle ilio-costal des lombes", "Crête iliaque", "Angles des 6 côtes inférieures", "Branche postérieure nn. spinaux", ""),
        ("muscle longissimus de la tête", "Processus transverse C3-T1", "Processus mastoïde", "Branche postérieure nn. spinaux", ""),
        ("muscle longissimus du cou", "Processus transverses T1-T6", "Processus transverses C2-C7", "Branche postérieure nn. spinaux", ""),
        ("muscle longissimus du thorax", "Crête iliaque, processus épineux L1-S4, processus mamillaires L1-L2, processus transverses T7-T12", "Processus costiformes L1-L5, angles des côtes 2-12, processus transverses T1-T12", "Branche postérieure nn. spinaux", ""),
        ("muscle épineux du thorax", "Processus épineux T11-L2", "Processus épineux T2-T11", "Branche postérieure nn. spinaux", ""),
        ("muscle épineux du cou", "Processus épineux C6-T2", "Processus épineux C2-C4", "Branche postérieur nn. spinaux", ""),
        ("muscle épineux de la tête", "Inconstant", "Inconstant", "Branche postérieure nn. spinaux", ""),
        ("muscle semi-épineux du cou", "Processus transverses T1-T6", "Processus épineux C2-C5", "Branche postérieure nn. spinaux", ""),
        ("muscle semi-épineux du thorax", "Processus transverses T7-T12", "Processus épineux C6-T6", "Branche postérieure nn. spinaux", ""),
        ("muscles rotateurs et multifides", "Processus transverse", "Processus épineux", "Branche postérieure nn. spinaux", ""),
        ("muscle inter-épineux", "Processus épineux (cervical et lombaire)", "Processus épineux adjacent", "Branche postérieure nn. spinaux", ""),
        ("muscle inter-transversaire", "Processus transverse (cervical et lombaire", "Processus transverse adjacent", "Branche postérieure nn. spinaux", "")
    ]

    static let thoraxAndAbdomenMuscles = [
        ("muscles intercostaux externes", "Dirigés obliquement en bas et en avant", "Dirigés obliquement en bas et en avant", "NN. intercostaux", ""),
        ("muscles intercostaux internes", "Dirigés obliquement en bas et en arrière", "Dirigés obliquement en bas et en arrière", "NN. intercostaux", ""),
        ("muscles intercostaux intimes", "Plan le plus profond des muscles intercostaux internes", "Plan le plus profond des muscles intercostaux internes", "NN. intercostaux", ""),
        ("muscle transverse du thorax", "Face interne paroi ventrale du sternum", "Cartilages costaux 2-6", "NN. intercostaux", ""),
        ("muscle droit de l'abdomen", "Cartilage côtes 5-7, processus xyphoïde", "Symphyse et crête pubiennes", "NN. intercostaux et n. subcostal", ""),
        ("muscle pyramidal", "Pubis", "Ligne blanche", "NN. subcostal", ""),
        ("muscle oblique externe", "Face externe côtes 5-12. crête iliaque, fascia thoraco-lombaire, lig. inguinal", "Gaine du muscle droit de l'abdomen et ligne blanche", "NN. intercostaux et n. subcostal", ""),
        ("muscle oblique interne", "Crête iliaque, fascia thoraco-lombaire, lig. inguinal", "Côtes 10-12, Gaine du muscle droit de l'abdomen et ligne blanche", "NN. intercostaux et n. subcostal", ""),
        ("muscle transverse de l'abdomen", "Face interne côtes 7-12, crête iliaque, fascia thoraco-lombaire, lig. inguinal", "Gaine du muscle droit de l'abdomen et ligne blanche", "NN. intercostaux et n. subcostal", "")
    ]

    // Helper method to create Muscle objects from the static data
    static func createMuscle(from data: (String, String, String, String, String), category: MuscleCategory, subcategory: MuscleSubcategory) -> Muscle {
        return Muscle(
            name: data.0,
            origin: data.1,
            insertion: data.2,
            innervation: data.3,
            vascularization: data.4,
            category: category,
            subcategory: subcategory
        )
    }

    static func getAllMuscles() -> [Muscle] {
        var muscles: [Muscle] = []

        // Upper Limb
        muscles += shoulderAnteriorMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .shoulderAnterior) }
        muscles += shoulderPosteriorMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .shoulderPosterior) }
        muscles += armMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .arm) }
        muscles += forearmAnteriorMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .forearmAnterior) }
        muscles += forearmPosteriorMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .forearmPosterior) }
        muscles += handMuscles.map { createMuscle(from: $0, category: .upperLimb, subcategory: .hand) }

        // Lower Limb
        muscles += hipMuscles.map { createMuscle(from: $0, category: .lowerLimb, subcategory: .hip) }
        muscles += thighMuscles.map { createMuscle(from: $0, category: .lowerLimb, subcategory: .thigh) }
        muscles += legMuscles.map { createMuscle(from: $0, category: .lowerLimb, subcategory: .leg) }
        muscles += footMuscles.map { createMuscle(from: $0, category: .lowerLimb, subcategory: .foot) }

        // Trunk
        muscles += neckAndNapeMuscles.map { createMuscle(from: $0, category: .trunk, subcategory: .neckAndNape) }
        muscles += backMuscles.map { createMuscle(from: $0, category: .trunk, subcategory: .back) }
        muscles += thoraxAndAbdomenMuscles.map { createMuscle(from: $0, category: .trunk, subcategory: .thoraxAndAbdomen) }

        return muscles
    }
}