--[[
    ╔═══════════════════════════════════════════════╗
    ║           AUTO ANSWER (ALL-IN-ONE)            ║
    ║       Made By CozzyBruh                       ║
    ╚═══════════════════════════════════════════════╝
    
    Single file version — paste this directly into your executor.
    For the split GitHub version, see the separate files.
]]

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

-- ╔═══════════════════════════════════════════════╗
-- ║               SECTION 1: WORD LIST            ║
-- ╚═══════════════════════════════════════════════╝

local WordList = {
    "ABANDON","ABACUS","ABILITY","ABLE","ABOUT","ABOVE","ABROAD","ABSENCE","ABSOLUTE","ABSORB",
    "ABSTRACT","ABSURD","ABUSE","ACADEMY","ACCELERATE","ACCENT","ACCEPT","ACCESS","ACCIDENT",
    "ACCOUNT","ACCURATE","ACHIEVE","ACID","ACKNOWLEDGE","ACORN","ACQUIRE","ACROSS","ACTION",
    "ACTIVATE","ACTIVE","ACTIVITY","ACTOR","ACTUAL","ADAPT","ADDRESS","ADEQUATE","ADJUST",
    "ADMIRAL","ADMIT","ADOPT","ADULT","ADVANCE","ADVANTAGE","ADVENTURE","ADVICE","AFFAIR",
    "AFFECT","AFFORD","AFRAID","AFTER","AFTERNOON","AGAIN","AGAINST","AGENT","AGREE","AHEAD",
    "AIRCRAFT","AIRPLANE","ALARM","ALBUM","ALCOHOL","ALERT","ALIEN","ALIGN","ALIVE","ALLEY",
    "ALLOW","ALMOST","ALONE","ALPHA","ALREADY","ALTER","ALWAYS","AMATEUR","AMAZING","AMBITION",
    "AMBULANCE","AMONG","AMOUNT","AMUSE","ANCHOR","ANCIENT","ANGEL","ANGER","ANGLE","ANGRY",
    "ANIMAL","ANKLE","ANNOUNCE","ANNUAL","ANOTHER","ANSWER","ANTENNA","ANTIQUE","ANXIETY",
    "APART","APOLOGY","APPEAR","APPLE","APPLY","APPROACH","APPROVE","APRIL","ARCH","ARCTIC",
    "ARENA","ARGUE","ARMOR","ARMY","AROUND","ARRANGE","ARREST","ARRIVE","ARROW","ARTICLE",
    "ARTIST","ARTWORK","ASPECT","ASSAULT","ASSET","ASSIST","ASSUME","ASTHMA","ATHLETE","ATOM",
    "ATTACK","ATTEMPT","ATTEND","ATTITUDE","ATTRACT","AUCTION","AUGUST","AUNT","AUTHOR","AUTO",
    "AUTUMN","AVERAGE","AVOCADO","AVOID","AWAKE","AWARE","AWFUL","AWKWARD",
    "BABY","BACHELOR","BACON","BADGE","BALANCE","BALCONY","BALL","BAMBOO","BANANA","BAND",
    "BANK","BARREL","BASE","BASIC","BASKET","BATTLE","BEACH","BEAN","BEAUTY","BECAUSE","BECOME",
    "BEEF","BEFORE","BEGIN","BEHAVE","BEHIND","BELIEVE","BELL","BELOW","BELT","BENCH","BENEFIT",
    "BEST","BETRAY","BETTER","BETWEEN","BEYOND","BICYCLE","BILLION","BIRD","BIRTH","BITTER",
    "BLACK","BLADE","BLAME","BLANKET","BLAST","BLEAK","BLESS","BLIND","BLOOD","BLOSSOM","BLOW",
    "BLUE","BLUR","BLUSH","BOARD","BOAT","BODY","BOIL","BOMB","BONE","BONUS","BOOK","BOOST",
    "BORDER","BORING","BORN","BOSS","BOTTOM","BOUNCE","BRACKET","BRAIN","BRAND","BRASS","BRAVE",
    "BREAD","BREEZE","BRICK","BRIDGE","BRIEF","BRIGHT","BRING","BROAD","BROCCOLI","BROKEN",
    "BRONZE","BROOM","BROTHER","BROWN","BRUSH","BUBBLE","BUCKET","BUDGET","BUFFALO","BUILD",
    "BULK","BULLET","BUNDLE","BURDEN","BURGER","BURST","BUSINESS","BUSY","BUTTER","BUYER",
    "CABIN","CABLE","CACTUS","CAGE","CAKE","CALL","CALM","CAMERA","CAMP","CAMPAIGN","CANAL",
    "CANCEL","CANDY","CANNON","CAPABLE","CAPITAL","CAPTAIN","CARBON","CARD","CARGO","CARPET",
    "CARRY","CART","CASE","CASH","CASINO","CASTLE","CASUAL","CATALOG","CATCH","CATEGORY",
    "CATTLE","CAUGHT","CAUSE","CAUTION","CAVE","CEILING","CELERY","CEMENT","CENSUS","CENTURY",
    "CEREAL","CERTAIN","CHAIR","CHALK","CHAMPION","CHANCE","CHANGE","CHANNEL","CHAPTER",
    "CHARGE","CHARM","CHART","CHASE","CHEAP","CHECK","CHEESE","CHEF","CHERRY","CHEST",
    "CHICKEN","CHIEF","CHILD","CHIMNEY","CHOICE","CHOOSE","CHUNK","CHURCH","CIGAR","CINEMA",
    "CIRCLE","CITIZEN","CITY","CIVIL","CLAIM","CLAP","CLARIFY","CLASS","CLASSIC","CLEAN",
    "CLEAR","CLEVER","CLICK","CLIENT","CLIFF","CLIMB","CLINIC","CLIP","CLOCK","CLOSE","CLOTH",
    "CLOUD","CLOWN","CLUB","CLUE","CLUSTER","CLUTCH","COACH","COAST","COCONUT","CODE","COFFEE",
    "COIL","COIN","COLLECT","COLOR","COLUMN","COMBINE","COME","COMFORT","COMIC","COMMON",
    "COMPANY","CONCERT","CONDUCT","CONFIRM","CONGRESS","CONNECT","CONSIDER","CONTROL",
    "CONVINCE","COOK","COOL","COPPER","COPY","CORAL","CORE","CORN","CORRECT","COST","COTTON",
    "COUCH","COUNTRY","COUPLE","COURSE","COUSIN","COVER","COYOTE","CRACK","CRADLE","CRAFT",
    "CRASH","CRATER","CRAWL","CRAZY","CREAM","CREDIT","CREEK","CREW","CRICKET","CRIME",
    "CRISIS","CRITIC","CROP","CROSS","CROUCH","CROWD","CRUCIAL","CRUEL","CRUISE","CRUMBLE",
    "CRUSH","CRYSTAL","CUBE","CULTURE","CURIOUS","CURRENT","CURTAIN","CURVE","CUSHION",
    "CUSTOM","CYCLE",
    "DAMAGE","DAMP","DANCE","DANGER","DARING","DASH","DAUGHTER","DAWN","DEAL","DEBATE",
    "DEBRIS","DECADE","DECEMBER","DECIDE","DECLINE","DECORATE","DECREASE","DEER","DEFENSE",
    "DEFINE","DEGREE","DELAY","DELIVER","DEMAND","DEMISE","DENIAL","DENTIST","DENY","DEPART",
    "DEPEND","DEPOSIT","DEPTH","DEPUTY","DERIVE","DESCRIBE","DESERT","DESIGN","DESK","DESPAIR",
    "DESTROY","DETAIL","DETECT","DEVELOP","DEVICE","DEVOTE","DIAGRAM","DIAL","DIAMOND","DIARY",
    "DICE","DIESEL","DIET","DIFFER","DIGITAL","DIGNITY","DILEMMA","DINNER","DINOSAUR","DIRECT",
    "DIRT","DISAGREE","DISCOVER","DISEASE","DISH","DISMISS","DISORDER","DISPLAY","DISTANCE",
    "DIVERT","DIVIDE","DIVORCE","DIZZY","DOCTOR","DOCUMENT","DOLL","DOLPHIN","DOMAIN","DONATE",
    "DONKEY","DONOR","DOOR","DOSE","DOUBLE","DOVE","DRAFT","DRAGON","DRAMA","DRASTIC","DRAW",
    "DREAM","DRESS","DRIFT","DRILL","DRINK","DRIP","DRIVE","DROP","DRUM","DUCK","DUMB","DUNE",
    "DURING","DUST","DUTCH","DUTY","DWARF","DYNAMIC",
    "EAGER","EAGLE","EARLY","EARN","EARTH","EASILY","EAST","EASY","ECHO","ECOLOGY","ECONOMY",
    "EDGE","EDIT","EDUCATE","EFFORT","EIGHT","EITHER","ELBOW","ELDER","ELECTRIC","ELEGANT",
    "ELEMENT","ELEPHANT","ELEVATOR","ELITE","ELSE","EMBARK","EMBODY","EMBRACE","EMERGE",
    "EMOTION","EMPLOY","EMPOWER","EMPTY","ENABLE","ENACT","ENCOUNTER","ENCOURAGE","ENDLESS",
    "ENDORSE","ENEMY","ENERGY","ENFORCE","ENGAGE","ENGINE","ENHANCE","ENJOY","ENLIST","ENOUGH",
    "ENRICH","ENROLL","ENSURE","ENTER","ENTIRE","ENTRY","ENVELOPE","EPISODE","EQUAL","EQUIP",
    "ERODE","EROSION","ERROR","ERUPT","ESCAPE","ESSAY","ESSENCE","ESTATE","ETERNAL","ETHICS",
    "EVIDENCE","EVIL","EVOLVE","EXACT","EXAMPLE","EXCESS","EXCHANGE","EXCITE","EXCLUDE",
    "EXCUSE","EXECUTE","EXERCISE","EXHAUST","EXHIBIT","EXILE","EXIST","EXIT","EXOTIC","EXPAND",
    "EXPECT","EXPIRE","EXPLAIN","EXPOSE","EXPRESS","EXTEND","EXTRA","EYEBROW",
    "FABRIC","FACE","FACULTY","FADE","FAINT","FAITH","FALL","FALSE","FAME","FAMILY","FAMOUS",
    "FANCY","FANTASY","FARM","FASHION","FATAL","FATHER","FATIGUE","FAULT","FAVORITE","FEATURE",
    "FEBRUARY","FEDERAL","FEED","FEEL","FEMALE","FENCE","FESTIVAL","FETCH","FEVER","FIBER",
    "FICTION","FIELD","FIGURE","FILE","FILL","FILM","FILTER","FINAL","FIND","FINE","FINGER",
    "FINISH","FIRE","FIRM","FIRST","FISCAL","FISH","FITNESS","FLAG","FLAME","FLASH","FLAT",
    "FLAVOR","FLEE","FLIGHT","FLIP","FLOAT","FLOCK","FLOOR","FLOWER","FLUID","FLUSH","FOAM",
    "FOCUS","FOIL","FOLD","FOLLOW","FOOD","FOOT","FORCE","FOREST","FORGET","FORK","FORTUNE",
    "FORUM","FORWARD","FOSSIL","FOSTER","FOUND","FRAGILE","FRAME","FREQUENT","FRESH","FRIEND",
    "FRINGE","FROG","FRONT","FROST","FROZEN","FRUIT","FUEL","FUNNY","FURNACE","FURY","FUTURE",
    "GADGET","GAIN","GALAXY","GALLERY","GAME","GARAGE","GARBAGE","GARDEN","GARLIC","GARMENT",
    "GASP","GATE","GATHER","GAUGE","GAZE","GENERAL","GENIUS","GENRE","GENTLE","GENUINE",
    "GESTURE","GHOST","GIANT","GIFT","GIGGLE","GINGER","GIRAFFE","GIVE","GLAD","GLANCE",
    "GLARE","GLASS","GLEAM","GLOBE","GLOOM","GLORY","GLOVE","GLOW","GLUE","GOAT","GODDESS",
    "GOLD","GOOD","GOOSE","GORILLA","GOSPEL","GOSSIP","GOVERN","GOWN","GRAB","GRACE","GRAIN",
    "GRAND","GRANT","GRAPE","GRASS","GRAVITY","GREAT","GREEN","GRID","GRIEF","GRIT","GROCERY",
    "GROUP","GROW","GRUNT","GUARD","GUESS","GUIDE","GUILT","GUITAR",
    "HABIT","HAIR","HALF","HAMMER","HAMSTER","HAND","HAPPY","HARBOR","HARD","HARSH","HARVEST",
    "HAVE","HAWK","HAZARD","HEAD","HEALTH","HEART","HEAVY","HEDGEHOG","HEIGHT","HELLO","HELMET",
    "HELP","HERO","HIRE","HISTORY","HOBBY","HOCKEY","HOLD","HOLE","HOLIDAY","HOLLOW","HOME",
    "HONEY","HOOD","HOPE","HORN","HORROR","HORSE","HOSPITAL","HOST","HOTEL","HOUR","HOVER",
    "HUGE","HUMAN","HUMBLE","HUMOR","HUNDRED","HUNGRY","HUNT","HURDLE","HURRY","HURT",
    "HUSBAND","HYBRID",
    "ICON","IDEA","IDENTIFY","IDLE","IGNORE","ILLEGAL","ILLNESS","IMAGE","IMITATE","IMMENSE",
    "IMMUNE","IMPACT","IMPOSE","IMPROVE","IMPULSE","INCH","INCLUDE","INCOME","INCREASE","INDEX",
    "INDICATE","INDOOR","INDUSTRY","INFANT","INFLICT","INFORM","INITIAL","INJECT","INMATE",
    "INNER","INNOCENT","INPUT","INQUIRY","INSANE","INSECT","INSIDE","INSPIRE","INSTALL",
    "INTACT","INTEREST","INTO","INVEST","INVITE","INVOLVE","IRON","ISLAND","ISOLATE","ISSUE",
    "ITEM","IVORY",
    "JACKET","JAGUAR","JAZZ","JEALOUS","JEANS","JELLY","JEWEL","JOIN","JOKE","JOURNEY","JUDGE",
    "JUICE","JUMP","JUNGLE","JUNIOR","JUNK","JUST",
    "KANGAROO","KEEN","KEEP","KETCHUP","KICK","KIDNEY","KIND","KINGDOM","KISS","KITCHEN","KITE",
    "KITTEN","KIWI","KNEE","KNIFE","KNOCK","KNOW",
    "LABEL","LABOR","LADDER","LADY","LAKE","LAMP","LANGUAGE","LAPTOP","LARGE","LATER","LATIN",
    "LAUGH","LAUNDRY","LAVA","LAWN","LAWSUIT","LAYER","LAZY","LEADER","LEAF","LEARN","LEAVE",
    "LECTURE","LEFT","LEGAL","LEGEND","LEISURE","LEMON","LEND","LENGTH","LENS","LEOPARD",
    "LESSON","LETTER","LEVEL","LIBERTY","LIBRARY","LICENSE","LIFE","LIFT","LIGHT","LIKE","LIMB",
    "LIMIT","LINK","LION","LIQUID","LIST","LITTLE","LIVE","LIZARD","LOAD","LOAN","LOBSTER",
    "LOCAL","LOCK","LOGIC","LONELY","LONG","LOOP","LOTTERY","LOUD","LOUNGE","LOVE","LOYAL",
    "LUCKY","LUGGAGE","LUMBER","LUNAR","LUNCH","LUXURY",
    "MACHINE","MAGIC","MAGNET","MAID","MAIN","MAJOR","MAKE","MAMMAL","MANAGE","MANDATE",
    "MANGO","MANSION","MANUAL","MAPLE","MARBLE","MARCH","MARGIN","MARINE","MARKET","MARRIAGE",
    "MASK","MASS","MASTER","MATCH","MATERIAL","MATH","MATRIX","MATTER","MAXIMUM","MAZE",
    "MEADOW","MEAN","MEASURE","MEAT","MECHANIC","MEDIA","MELODY","MELT","MEMBER","MEMORY",
    "MENTION","MENTOR","MERCY","MERGE","MERIT","MERRY","MESH","MESSAGE","METAL","METHOD",
    "MIDDLE","MIDNIGHT","MILK","MILLION","MIMIC","MIND","MINIMUM","MINOR","MINUTE","MIRACLE",
    "MIRROR","MISERY","MISS","MISTAKE","MIXTURE","MOBILE","MODEL","MODIFY","MOMENT","MONITOR",
    "MONKEY","MONSTER","MONTH","MOON","MORAL","MORE","MORNING","MOSQUITO","MOTHER","MOTION",
    "MOTOR","MOUNTAIN","MOUSE","MOVE","MOVIE","MUCH","MUFFIN","MULE","MULTIPLY","MUSCLE",
    "MUSEUM","MUSHROOM","MUSIC","MUST","MUTUAL","MYSELF","MYSTERY","MYTH",
    "NAIVE","NAME","NAPKIN","NARROW","NASTY","NATION","NATURE","NEAR","NECK","NEED","NEGATIVE",
    "NEGLECT","NEITHER","NEPHEW","NERVE","NEST","NETWORK","NEUTRAL","NEVER","NEWS","NEXT",
    "NICE","NIGHT","NOBLE","NOISE","NOMINEE","NORMAL","NORTH","NOSE","NOTABLE","NOTHING",
    "NOTICE","NOVEL","NUCLEAR","NUMBER","NURSE",
    "OBTAIN","OBVIOUS","OCCUR","OCEAN","OCTOBER","ODDS","OFFER","OFFICE","OFTEN","OLIVE",
    "OLYMPIC","OMIT","ONCE","ONION","ONLINE","ONLY","OPEN","OPERA","OPINION","OPPOSE","OPTION",
    "ORANGE","ORBIT","ORCHARD","ORDER","ORDINARY","ORGAN","ORIENT","ORIGINAL","ORPHAN",
    "OSTRICH","OTHER","OUTDOOR","OUTER","OUTPUT","OUTSIDE","OVAL","OVEN","OVER","OWN","OWNER",
    "OXYGEN","OYSTER","OZONE",
    "PACT","PADDLE","PAGE","PAIR","PALACE","PALM","PANDA","PANEL","PANIC","PANTHER","PAPER",
    "PARADE","PARENT","PARK","PARROT","PARTY","PASS","PATCH","PATH","PATIENT","PATROL",
    "PATTERN","PAUSE","PAVE","PAYMENT","PEACE","PEANUT","PEAR","PEASANT","PELICAN","PENALTY",
    "PENCIL","PEOPLE","PEPPER","PERFECT","PERMIT","PERSON","PHONE","PHOTO","PHRASE","PHYSICAL",
    "PIANO","PICNIC","PICTURE","PIECE","PILOT","PINK","PIONEER","PIPE","PISTOL","PITCH",
    "PIZZA","PLACE","PLANET","PLASTIC","PLATE","PLAY","PLEASE","PLEDGE","PLUCK","PLUG",
    "PLUNGE","POCKET","POEM","POET","POINT","POLAR","POLE","POLICE","POND","PONY","POOL",
    "POPULAR","PORK","PORTION","POSITION","POSSIBLE","POST","POTATO","POTTERY","POVERTY",
    "POWDER","POWER","PRACTICE","PRAISE","PREDICT","PREFER","PREPARE","PRESENT","PRETTY",
    "PREVENT","PRICE","PRIDE","PRIMARY","PRINT","PRIORITY","PRISON","PRIVATE","PRIZE",
    "PROBLEM","PROCESS","PRODUCE","PROFIT","PROGRAM","PROJECT","PROMOTE","PROOF","PROPERTY",
    "PROSPER","PROTECT","PROUD","PROVIDE","PUBLIC","PUDDING","PULL","PULP","PULSE","PUMPKIN",
    "PUNCH","PUPIL","PUPPY","PURCHASE","PURITY","PURPOSE","PURSE","PUSH","PUZZLE","PYRAMID",
    "QUALITY","QUANTUM","QUARTER","QUESTION","QUICK","QUIET","QUIT","QUIZ","QUOTE",
    "RABBIT","RACCOON","RACE","RACK","RADAR","RADIO","RAIL","RAIN","RAISE","RALLY","RAMP",
    "RANCH","RANDOM","RANGE","RAPID","RARE","RATE","RATHER","RAVEN","RAZOR","READY","REAL",
    "REASON","REBEL","REBUILD","RECALL","RECEIVE","RECIPE","RECORD","RECYCLE","REDUCE",
    "REFLECT","REFORM","REGION","REGRET","REGULAR","REJECT","RELAX","RELEASE","RELIEF","RELY",
    "REMAIN","REMEMBER","REMIND","REMOVE","RENDER","RENEW","RENT","REOPEN","REPAIR","REPEAT",
    "REPLACE","REPORT","REQUIRE","RESCUE","RESEMBLE","RESIST","RESOURCE","RESPONSE","RESULT",
    "RETIRE","RETREAT","RETURN","REUNION","REVEAL","REVIEW","REWARD","RHYTHM","RIBBON","RICE",
    "RICH","RIDE","RIDGE","RIFLE","RIGHT","RIGID","RING","RIOT","RIPPLE","RISK","RITUAL",
    "RIVAL","RIVER","ROAD","ROAST","ROBOT","ROBUST","ROCKET","ROMANCE","ROOF","ROOKIE","ROOM",
    "ROSE","ROTATE","ROUGH","ROUND","ROUTE","ROYAL","RUBBER","RUDE","RUGBY","RULER","RURAL",
    "SADDLE","SADNESS","SAFE","SAIL","SALAD","SALMON","SALON","SALT","SALUTE","SAME","SAMPLE",
    "SAND","SATISFY","SAUCE","SAUSAGE","SAVE","SCALE","SCAN","SCARE","SCATTER","SCENE",
    "SCHEME","SCHOOL","SCIENCE","SCISSORS","SCORPION","SCOUT","SCRAP","SCREEN","SCRIPT",
    "SCRUB","SEARCH","SEASON","SEAT","SECOND","SECRET","SECTION","SECURITY","SEED","SEEK",
    "SEGMENT","SELECT","SELL","SEMINAR","SENIOR","SENSE","SENTENCE","SERIES","SERVICE",
    "SESSION","SETTLE","SETUP","SEVEN","SHADOW","SHAFT","SHALLOW","SHARE","SHARK","SHARP",
    "SHED","SHELL","SHERIFF","SHIELD","SHIFT","SHINE","SHIP","SHIVER","SHOCK","SHOE","SHOOT",
    "SHOP","SHORT","SHOULDER","SHOVE","SHRIMP","SHUFFLE","SHUT","SIBLING","SICK","SIDE",
    "SIEGE","SIGHT","SIGN","SILENT","SILK","SILLY","SILVER","SIMILAR","SIMPLE","SINCE",
    "SISTER","SITUATE","SIZE","SKATE","SKETCH","SKILL","SKIN","SKIRT","SKULL","SLAB","SLAM",
    "SLEEP","SLENDER","SLICE","SLIDE","SLIGHT","SLIM","SLOGAN","SLOT","SLOW","SLUSH","SMALL",
    "SMART","SMILE","SMOKE","SMOOTH","SNACK","SNAKE","SNAP","SNIFF","SNOW","SOAP","SOCCER",
    "SOCIAL","SOCK","SODA","SOFT","SOLAR","SOLDIER","SOLID","SOLUTION","SOLVE","SOMEONE",
    "SONG","SOON","SORRY","SORT","SOUL","SOUND","SOUP","SOURCE","SOUTH","SPACE","SPARE",
    "SPATIAL","SPAWN","SPEAK","SPECIAL","SPEED","SPELL","SPEND","SPHERE","SPICE","SPIDER",
    "SPIKE","SPIN","SPIRIT","SPLIT","SPONSOR","SPOON","SPORT","SPOT","SPRAY","SPREAD",
    "SPRING","SPY","SQUARE","SQUEEZE","SQUIRREL","STABLE","STADIUM","STAFF","STAGE","STAIRS",
    "STAMP","STAND","START","STATE","STAY","STEAK","STEEL","STEM","STEP","STEREO","STICK",
    "STILL","STING","STOCK","STOMACH","STONE","STOOL","STORY","STOVE","STRATEGY","STREET",
    "STRIKE","STRONG","STRUGGLE","STUDENT","STUFF","STUMBLE","STYLE","SUBJECT","SUBMIT",
    "SUBWAY","SUCCESS","SUCH","SUDDEN","SUFFER","SUGAR","SUGGEST","SUIT","SUMMER","SUNNY",
    "SUNSET","SUPER","SUPPLY","SUPREME","SURE","SURFACE","SURGE","SURPRISE","SURROUND",
    "SURVEY","SUSPECT","SUSTAIN","SWALLOW","SWAMP","SWAP","SWARM","SWEET","SWIM","SWING",
    "SWITCH","SWORD","SYMBOL","SYMPTOM","SYRUP","SYSTEM",
    "TABLE","TACKLE","TALENT","TALK","TANK","TAPE","TARGET","TASK","TASTE","TATTOO","TAXI",
    "TEACH","TEAM","TELL","TENANT","TEND","TERM","TEST","TEXT","THANK","THAT","THEME","THEN",
    "THEORY","THERE","THEY","THING","THIS","THOUGHT","THREE","THRIVE","THROW","THUMB",
    "THUNDER","TICKET","TIDE","TIGER","TILT","TIMBER","TIME","TINY","TIRED","TISSUE","TITLE",
    "TOAST","TOBACCO","TODAY","TODDLER","TOGETHER","TOILET","TOKEN","TOMATO","TOMORROW","TONE",
    "TONGUE","TONIGHT","TOOL","TOOTH","TOPIC","TOPPLE","TORCH","TORNADO","TORTOISE","TOSS",
    "TOTAL","TOURIST","TOWARD","TOWER","TOWN","TRACK","TRADE","TRAFFIC","TRAGIC","TRAIN",
    "TRANSFER","TRAP","TRASH","TRAVEL","TRAY","TREAT","TREE","TREND","TRIAL","TRIBE","TRICK",
    "TRIGGER","TRIM","TRIP","TROPHY","TROUBLE","TRUCK","TRUE","TRULY","TRUMPET","TRUST",
    "TRUTH","TUBE","TUNA","TUNNEL","TURKEY","TURN","TURTLE","TWELVE","TWENTY","TWICE","TWIN",
    "TWIST","TYPE","TYPICAL",
    "UGLY","UMBRELLA","UNABLE","UNAWARE","UNCLE","UNCOVER","UNDER","UNDO","UNFAIR","UNFOLD",
    "UNHAPPY","UNIFORM","UNION","UNIQUE","UNIT","UNIVERSE","UNKNOWN","UNLOCK","UNTIL",
    "UNUSUAL","UNVEIL","UPDATE","UPGRADE","UPHOLD","UPON","UPPER","UPSET","URBAN","USAGE",
    "USEFUL","USELESS","USUAL","UTILITY",
    "VACANT","VACUUM","VAGUE","VALID","VALLEY","VALVE","VANISH","VAPOR","VARIOUS","VAST",
    "VAULT","VEHICLE","VELVET","VENDOR","VENTURE","VENUE","VERB","VERIFY","VERSION","VERY",
    "VESSEL","VETERAN","VIABLE","VIBRANT","VICIOUS","VICTORY","VIDEO","VIEW","VILLAGE",
    "VINTAGE","VIOLIN","VIRTUAL","VIRUS","VISA","VISIT","VISUAL","VITAL","VIVID","VOCAL",
    "VOICE","VOID","VOLCANO","VOLUME","VOTE","VOYAGE",
    "WAGE","WAGON","WAIT","WALK","WALL","WALNUT","WANT","WARFARE","WARM","WARRIOR","WASH",
    "WASP","WASTE","WATER","WAVE","WAY","WEALTH","WEAPON","WEAR","WEASEL","WEATHER","WEB",
    "WEDDING","WEEKEND","WEIRD","WELCOME","WEST","WHALE","WHEAT","WHEEL","WHEN","WHERE","WHIP",
    "WHISPER","WIDE","WIDTH","WIFE","WILD","WILL","WIN","WINDOW","WINE","WING","WINNER",
    "WINTER","WIRE","WISDOM","WISE","WISH","WITNESS","WOLF","WOMAN","WONDER","WOOD","WOOL",
    "WORD","WORK","WORLD","WORRY","WORTH","WRAP","WRECK","WRESTLE","WRIST","WRITE","WRONG",
    "XEROX","YACHT","YARD","YEAR","YELLOW","YOUNG","YOUTH","ZEBRA","ZERO","ZONE","ZOO"
}

-- Pre-index words by letter
local WordsByLetter = {}
for _, word in ipairs(WordList) do
    for i = 1, #word do
        local c = string.sub(word, i, i)
        if not WordsByLetter[c] then WordsByLetter[c] = {} end
        table.insert(WordsByLetter[c], word)
    end
end

-- ╔═══════════════════════════════════════════════╗
-- ║               SECTION 2: ENGINE               ║
-- ╚═══════════════════════════════════════════════╝

local AutoEnabled = false
local SpeedMin = 0.05
local SpeedMax = 0.15
local answerLoop = nil

local DataRemote = ReplicatedStorage:WaitForChild("ffrostflame_bridgenet2@1.0.0"):WaitForChild("dataRemoteEvent")
local PickWordRemote = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("PickWord")
local InstructionsLabel = Player.PlayerGui:WaitForChild("KeyboardGui"):WaitForChild("Main"):WaitForChild("Instructions")

local function ParseInstruction(text)
    if not text or text == "" then return nil end
    local lower = string.lower(text)
    
    if string.find(lower, "enter a letter") then
        return "LETTER"
    end
    
    local letterSection = string.match(text, "with%s+(.+)!")
    if letterSection then
        local letters = {}
        for letter in string.gmatch(letterSection, "%u") do
            table.insert(letters, letter)
        end
        if #letters > 0 then return letters end
    end
    return nil
end

local function FindWord(requiredLetters)
    if not requiredLetters or #requiredLetters == 0 then return nil end
    local candidates = WordsByLetter[requiredLetters[1]] or {}
    local results = {}
    for _, word in ipairs(candidates) do
        local valid = true
        for _, letter in ipairs(requiredLetters) do
            if not string.find(word, letter) then valid = false; break end
        end
        if valid then table.insert(results, word) end
    end
    if #results > 0 then return results[math.random(1, #results)] end
    return nil
end

local function TypeWord(word)
    local typed = ""
    for i = 1, #word do
        if not AutoEnabled then return end
        typed = typed .. string.sub(word, i, i)
        DataRemote:FireServer({typed, "\019"})
        task.wait(SpeedMin + math.random() * (SpeedMax - SpeedMin))
    end
    PickWordRemote:FireServer(word)
end

local function TypeLetter()
    local letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local idx = math.random(1, 26)
    local letter = string.sub(letters, idx, idx)
    DataRemote:FireServer({letter, "\019"})
    task.wait(SpeedMin + math.random() * (SpeedMax - SpeedMin))
    PickWordRemote:FireServer(letter)
end

local function StartEngine()
    if answerLoop then return end
    AutoEnabled = true
    answerLoop = task.spawn(function()
        while AutoEnabled do
            pcall(function()
                local parsed = ParseInstruction(InstructionsLabel.Text)
                if parsed == "LETTER" then
                    TypeLetter()
                elseif parsed and type(parsed) == "table" then
                    local word = FindWord(parsed)
                    if word then TypeWord(word) end
                end
            end)
            task.wait(0.5)
        end
    end)
end

local function StopEngine()
    AutoEnabled = false
    answerLoop = nil
end

-- ╔═══════════════════════════════════════════════╗
-- ║            SECTION 3: UI LIBRARY              ║
-- ╚═══════════════════════════════════════════════╝

local THEME = {
    Background       = Color3.fromRGB(15, 15, 20),
    BackgroundSecond = Color3.fromRGB(20, 20, 28),
    Surface          = Color3.fromRGB(25, 25, 35),
    SurfaceHover     = Color3.fromRGB(32, 32, 45),
    Border           = Color3.fromRGB(40, 40, 55),
    Accent           = Color3.fromRGB(88, 101, 242),
    AccentHover      = Color3.fromRGB(108, 121, 255),
    TextPrimary      = Color3.fromRGB(235, 235, 245),
    TextSecondary    = Color3.fromRGB(145, 145, 165),
    TextMuted        = Color3.fromRGB(90, 90, 110),
    Success          = Color3.fromRGB(72, 199, 142),
    Warning          = Color3.fromRGB(250, 176, 67),
    Error            = Color3.fromRGB(237, 95, 95),
    CornerRadius     = UDim.new(0, 10),
    SmallRadius      = UDim.new(0, 6),
}

local function Tween(obj, props, dur, style)
    local t = TweenService:Create(obj, TweenInfo.new(dur or 0.3, style or Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    t:Play(); return t
end

local function Create(class, props)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do inst[k] = v end
    return inst
end

local function Corner(parent, r) return Create("UICorner", {CornerRadius = r or THEME.CornerRadius, Parent = parent}) end
local function Stroke(parent) return Create("UIStroke", {Color = THEME.Border, Thickness = 1, Transparency = 0.5, Parent = parent}) end

-- ScreenGui
local ScreenGui = Create("ScreenGui", {
    Name = "AutoAnswerUI", ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Parent = Player:WaitForChild("PlayerGui")
})

local Shadow = Create("ImageLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, 560, 0, 420), BackgroundTransparency = 1,
    Image = "rbxassetid://6014261993", ImageColor3 = Color3.fromRGB(0, 0, 0),
    ImageTransparency = 0.4, ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(49, 49, 450, 450), Parent = ScreenGui
})

local MainFrame = Create("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0),
    Size = UDim2.new(0, 520, 0, 380), BackgroundColor3 = THEME.Background,
    BorderSizePixel = 0, ClipsDescendants = true, Parent = ScreenGui
})
Corner(MainFrame); Stroke(MainFrame)

-- Dragging
local dragging, dragInput, dragStart, startPos
local function dragUpdate(input)
    local delta = input.Position - dragStart
    local target = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    Tween(MainFrame, {Position = target}, 0.08, Enum.EasingStyle.Quart)
    Shadow.Position = target
end

-- TopBar
local TopBar = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = THEME.Background, BorderSizePixel = 0, Parent = MainFrame})
Create("Frame", {Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = THEME.Accent, BorderSizePixel = 0, Parent = TopBar})
Create("TextLabel", {Position = UDim2.new(0, 16, 0, 2), Size = UDim2.new(0, 200, 1, -2), BackgroundTransparency = 1, Text = "Auto Answer", TextColor3 = THEME.TextPrimary, TextSize = 14, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, Parent = TopBar})
Create("TextLabel", {Position = UDim2.new(0, 120, 0, 2), Size = UDim2.new(0, 160, 1, -2), BackgroundTransparency = 1, Text = "Made By CozzyBruh", TextColor3 = THEME.TextMuted, TextSize = 11, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, Parent = TopBar})

local CloseBtn = Create("TextButton", {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 1), Size = UDim2.new(0, 28, 0, 28), BackgroundTransparency = 1, Text = "✕", TextColor3 = THEME.TextSecondary, TextSize = 14, Font = Enum.Font.GothamBold, Parent = TopBar})
Corner(CloseBtn, THEME.SmallRadius)
local MinBtn = Create("TextButton", {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -42, 0.5, 1), Size = UDim2.new(0, 28, 0, 28), BackgroundTransparency = 1, Text = "─", TextColor3 = THEME.TextSecondary, TextSize = 14, Font = Enum.Font.GothamBold, Parent = TopBar})
Corner(MinBtn, THEME.SmallRadius)

for _, b in pairs({CloseBtn, MinBtn}) do
    b.MouseEnter:Connect(function() Tween(b, {BackgroundTransparency = 0.5, TextColor3 = THEME.TextPrimary}, 0.15) end)
    b.MouseLeave:Connect(function() Tween(b, {BackgroundTransparency = 1, TextColor3 = THEME.TextSecondary}, 0.15) end)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
TopBar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then dragUpdate(input) end end)

Create("Frame", {Position = UDim2.new(0, 0, 0, 44), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = THEME.Border, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = MainFrame})

-- Sidebar
local Sidebar = Create("Frame", {Position = UDim2.new(0, 0, 0, 45), Size = UDim2.new(0, 130, 1, -45), BackgroundColor3 = THEME.BackgroundSecond, BorderSizePixel = 0, ClipsDescendants = true, Parent = MainFrame})
Create("Frame", {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 0), Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = THEME.Border, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = Sidebar})
local SidebarInner = Create("Frame", {Position = UDim2.new(0, 6, 0, 8), Size = UDim2.new(1, -12, 1, -16), BackgroundTransparency = 1, Parent = Sidebar})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = SidebarInner})

-- Content
local ContentArea = Create("Frame", {Position = UDim2.new(0, 131, 0, 45), Size = UDim2.new(1, -131, 1, -45), BackgroundTransparency = 1, BorderSizePixel = 0, ClipsDescendants = true, Parent = MainFrame})

-- Notifications
local NotifHolder = Create("Frame", {AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -20, 1, -20), Size = UDim2.new(0, 250, 0, 300), BackgroundTransparency = 1, Parent = ScreenGui})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), VerticalAlignment = Enum.VerticalAlignment.Bottom, HorizontalAlignment = Enum.HorizontalAlignment.Right, Parent = NotifHolder})

local function Notify(title, message, duration, nType)
    local color = THEME.Accent
    if nType == "success" then color = THEME.Success elseif nType == "warning" then color = THEME.Warning elseif nType == "error" then color = THEME.Error end
    local n = Create("Frame", {Size = UDim2.new(0, 250, 0, 0), BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, ClipsDescendants = true, Parent = NotifHolder})
    Corner(n, THEME.SmallRadius); Stroke(n)
    Create("Frame", {Size = UDim2.new(0, 3, 1, 0), BackgroundColor3 = color, BorderSizePixel = 0, Parent = n})
    Create("TextLabel", {Position = UDim2.new(0, 14, 0, 10), Size = UDim2.new(1, -24, 0, 16), BackgroundTransparency = 1, Text = title, TextColor3 = THEME.TextPrimary, TextSize = 12, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, Parent = n})
    Create("TextLabel", {Position = UDim2.new(0, 14, 0, 28), Size = UDim2.new(1, -24, 0, 28), BackgroundTransparency = 1, Text = message, TextColor3 = THEME.TextSecondary, TextSize = 11, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = n})
    Tween(n, {Size = UDim2.new(0, 250, 0, 64)}, 0.35)
    task.delay(duration or 3, function() Tween(n, {Size = UDim2.new(0, 250, 0, 0), BackgroundTransparency = 1}, 0.3); task.wait(0.35); n:Destroy() end)
end

-- Open/Close
local isOpen = true
local function CloseUI()
    isOpen = false
    Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 0)}, 0.35)
    Tween(Shadow, {ImageTransparency = 1}, 0.3)
    task.wait(0.35); MainFrame.Visible = false; Shadow.Visible = false
end
local function OpenUI()
    MainFrame.Visible = true; Shadow.Visible = true
    MainFrame.Size = UDim2.new(0, 520, 0, 0); isOpen = true
    Tween(MainFrame, {Size = UDim2.new(0, 520, 0, 380)}, 0.4, Enum.EasingStyle.Back)
    Tween(Shadow, {ImageTransparency = 0.4}, 0.35)
end
CloseBtn.MouseButton1Click:Connect(CloseUI)
MinBtn.MouseButton1Click:Connect(CloseUI)
UserInputService.InputBegan:Connect(function(input, gpe) if gpe then return end; if input.KeyCode == Enum.KeyCode.RightShift then if isOpen then CloseUI() else OpenUI() end end end)

-- ╔═══════════════════════════════════════════════╗
-- ║            SECTION 4: TAB SYSTEM              ║
-- ╚═══════════════════════════════════════════════╝

local tabs = {}
local tabBtns = {}
local tabPages = {}
local activeTab = nil

local function SelectTab(idx)
    if activeTab == idx then return end
    if activeTab then
        local ob = tabBtns[activeTab]
        if ob then
            Tween(ob, {BackgroundTransparency = 1}, 0.2)
            if ob:FindFirstChild("TabIcon") then Tween(ob.TabIcon, {TextColor3 = THEME.TextMuted}, 0.2) end
            if ob:FindFirstChild("TabName") then Tween(ob.TabName, {TextColor3 = THEME.TextSecondary}, 0.2) end
            if ob:FindFirstChild("Indicator") then Tween(ob.Indicator, {BackgroundTransparency = 1}, 0.15) end
        end
        if tabPages[activeTab] then tabPages[activeTab].Visible = false end
    end
    activeTab = idx
    local nb = tabBtns[idx]
    if nb then
        Tween(nb, {BackgroundTransparency = 0.85}, 0.2)
        if nb:FindFirstChild("TabIcon") then Tween(nb.TabIcon, {TextColor3 = THEME.TextPrimary}, 0.2) end
        if nb:FindFirstChild("TabName") then Tween(nb.TabName, {TextColor3 = THEME.TextPrimary}, 0.2) end
        if nb:FindFirstChild("Indicator") then Tween(nb.Indicator, {BackgroundTransparency = 0}, 0.2) end
    end
    if tabPages[idx] then tabPages[idx].Visible = true end
end

local function AddTab(name, icon)
    local idx = #tabs + 1
    local btn = Create("TextButton", {Name = "Tab_"..name, Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = THEME.Accent, BackgroundTransparency = 1, BorderSizePixel = 0, Text = "", LayoutOrder = idx, Parent = SidebarInner})
    Corner(btn, THEME.SmallRadius)
    local ind = Create("Frame", {Name = "Indicator", Size = UDim2.new(0, 3, 0, 18), AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), BackgroundColor3 = THEME.Accent, BackgroundTransparency = 1, BorderSizePixel = 0, Parent = btn})
    Corner(ind, UDim.new(1, 0))
    Create("TextLabel", {Name = "TabIcon", Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, 20, 1, 0), BackgroundTransparency = 1, Text = icon or "•", TextColor3 = THEME.TextMuted, TextSize = 14, Font = Enum.Font.Gotham, Parent = btn})
    Create("TextLabel", {Name = "TabName", Position = UDim2.new(0, 34, 0, 0), Size = UDim2.new(1, -44, 1, 0), BackgroundTransparency = 1, Text = name, TextColor3 = THEME.TextSecondary, TextSize = 12, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left, Parent = btn})

    local page = Create("ScrollingFrame", {Name = name.."Page", Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = THEME.Accent, ScrollBarImageTransparency = 0.5, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false, Parent = ContentArea})
    Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = page})
    Create("UIPadding", {PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14), Parent = page})

    tabBtns[idx] = btn; tabPages[idx] = page; table.insert(tabs, name)

    btn.MouseEnter:Connect(function() if activeTab ~= idx then Tween(btn, {BackgroundTransparency = 0.88}, 0.15); Tween(btn.TabName, {TextColor3 = THEME.TextPrimary}, 0.15); Tween(btn.TabIcon, {TextColor3 = THEME.TextSecondary}, 0.15) end end)
    btn.MouseLeave:Connect(function() if activeTab ~= idx then Tween(btn, {BackgroundTransparency = 1}, 0.15); Tween(btn.TabName, {TextColor3 = THEME.TextSecondary}, 0.15); Tween(btn.TabIcon, {TextColor3 = THEME.TextMuted}, 0.15) end end)
    btn.MouseButton1Click:Connect(function() SelectTab(idx) end)
    if idx == 1 then SelectTab(1) end

    -- Element builders
    local Tab = {Page = page}

    function Tab:AddSection(text)
        return Create("TextLabel", {Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1, Text = string.upper(text), TextColor3 = THEME.TextMuted, TextSize = 10, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = #page:GetChildren(), Parent = page})
    end

    function Tab:AddLabel(text)
        return Create("TextLabel", {Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, Text = text, TextColor3 = THEME.TextSecondary, TextSize = 11, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, LayoutOrder = #page:GetChildren(), Parent = page})
    end

    function Tab:AddSeparator()
        local s = Create("Frame", {Size = UDim2.new(1, 0, 0, 8), BackgroundTransparency = 1, LayoutOrder = #page:GetChildren(), Parent = page})
        Create("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = THEME.Border, BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = s})
        return s
    end

    function Tab:AddToggle(text, default, callback)
        callback = callback or function() end; local toggled = default or false
        local f = Create("Frame", {Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, LayoutOrder = #page:GetChildren(), Parent = page})
        Corner(f, THEME.SmallRadius)
        Create("TextLabel", {Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(1, -60, 1, 0), BackgroundTransparency = 1, Text = text, TextColor3 = THEME.TextPrimary, TextSize = 12, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left, Parent = f})
        local tr = Create("Frame", {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0), Size = UDim2.new(0, 36, 0, 20), BackgroundColor3 = toggled and THEME.Accent or THEME.Border, BorderSizePixel = 0, Parent = f})
        Corner(tr, UDim.new(1, 0))
        local kn = Create("Frame", {AnchorPoint = Vector2.new(0, 0.5), Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0), Size = UDim2.new(0, 16, 0, 16), BackgroundColor3 = THEME.TextPrimary, BorderSizePixel = 0, Parent = tr})
        Corner(kn, UDim.new(1, 0))
        local cl = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = f})
        cl.MouseEnter:Connect(function() Tween(f, {BackgroundColor3 = THEME.SurfaceHover}, 0.15) end)
        cl.MouseLeave:Connect(function() Tween(f, {BackgroundColor3 = THEME.Surface}, 0.15) end)
        cl.MouseButton1Click:Connect(function()
            toggled = not toggled
            Tween(tr, {BackgroundColor3 = toggled and THEME.Accent or THEME.Border}, 0.2)
            Tween(kn, {Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)}, 0.2)
            callback(toggled)
        end)
        return f
    end

    function Tab:AddButton(text, callback)
        callback = callback or function() end
        local b2 = Create("TextButton", {Size = UDim2.new(1, 0, 0, 36), BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, Text = text, TextColor3 = THEME.TextPrimary, TextSize = 12, Font = Enum.Font.GothamMedium, LayoutOrder = #page:GetChildren(), Parent = page})
        Corner(b2, THEME.SmallRadius)
        b2.MouseEnter:Connect(function() Tween(b2, {BackgroundColor3 = THEME.SurfaceHover}, 0.15) end)
        b2.MouseLeave:Connect(function() Tween(b2, {BackgroundColor3 = THEME.Surface}, 0.15) end)
        b2.MouseButton1Click:Connect(function() Tween(b2, {BackgroundColor3 = THEME.Accent}, 0.1); task.wait(0.12); Tween(b2, {BackgroundColor3 = THEME.Surface}, 0.2); callback() end)
        return b2
    end

    function Tab:AddSlider(text, min, max, default, callback)
        callback = callback or function() end; min = min or 0; max = max or 100; default = default or min
        local f = Create("Frame", {Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, LayoutOrder = #page:GetChildren(), Parent = page})
        Corner(f, THEME.SmallRadius)
        Create("TextLabel", {Position = UDim2.new(0, 12, 0, 6), Size = UDim2.new(1, -60, 0, 18), BackgroundTransparency = 1, Text = text, TextColor3 = THEME.TextPrimary, TextSize = 12, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left, Parent = f})
        local vl = Create("TextLabel", {AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 6), Size = UDim2.new(0, 40, 0, 18), BackgroundTransparency = 1, Text = tostring(default), TextColor3 = THEME.Accent, TextSize = 12, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Right, Parent = f})
        local track = Create("Frame", {AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 32), Size = UDim2.new(1, -24, 0, 4), BackgroundColor3 = THEME.Border, BorderSizePixel = 0, Parent = f})
        Corner(track, UDim.new(1, 0))
        local fill = Create("Frame", {Size = UDim2.new((default-min)/(max-min), 0, 1, 0), BackgroundColor3 = THEME.Accent, BorderSizePixel = 0, Parent = track})
        Corner(fill, UDim.new(1, 0))
        local knob = Create("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new((default-min)/(max-min), 0, 0.5, 0), Size = UDim2.new(0, 12, 0, 12), BackgroundColor3 = THEME.TextPrimary, BorderSizePixel = 0, Parent = track})
        Corner(knob, UDim.new(1, 0))
        local sliding = false
        local sb = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = f})
        local function upd(input)
            local r = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local v = math.floor(min + (max - min) * r)
            Tween(fill, {Size = UDim2.new(r, 0, 1, 0)}, 0.08); Tween(knob, {Position = UDim2.new(r, 0, 0.5, 0)}, 0.08)
            vl.Text = tostring(v); callback(v)
        end
        sb.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true; upd(i) end end)
        sb.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end end)
        UserInputService.InputChanged:Connect(function(i) if sliding and i.UserInputType == Enum.UserInputType.MouseMovement then upd(i) end end)
        sb.MouseEnter:Connect(function() Tween(f, {BackgroundColor3 = THEME.SurfaceHover}, 0.15) end)
        sb.MouseLeave:Connect(function() Tween(f, {BackgroundColor3 = THEME.Surface}, 0.15) end)
        return f
    end

    return Tab
end

-- ╔═══════════════════════════════════════════════╗
-- ║          SECTION 5: BUILD THE TABS            ║
-- ╚═══════════════════════════════════════════════╝

-- HOME TAB
local HomeTab = AddTab("Home", "🏠")
HomeTab:AddSection("Auto Answer")
HomeTab:AddLabel("Toggle auto answer on/off below.")
HomeTab:AddSeparator()
HomeTab:AddToggle("Auto Answer", false, function(state)
    if state then StartEngine(); Notify("Auto Answer", "Enabled — answering automatically.", 2, "success")
    else StopEngine(); Notify("Auto Answer", "Disabled.", 2, "error") end
end)
HomeTab:AddSeparator()
HomeTab:AddSection("Speed Control")
HomeTab:AddSlider("Min Delay (ms)", 10, 500, 50, function(v) SpeedMin = v / 1000 end)
HomeTab:AddSlider("Max Delay (ms)", 10, 500, 150, function(v) SpeedMax = v / 1000 end)
HomeTab:AddSeparator()
HomeTab:AddLabel("Lower = faster typing. Higher = slower.")

-- SETTINGS TAB
local SettingsTab = AddTab("Settings", "⚙️")
SettingsTab:AddSection("UI Settings")
SettingsTab:AddButton("Reset Position", function()
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Notify("Settings", "Position reset.", 2)
end)
SettingsTab:AddButton("Destroy UI", function()
    StopEngine(); ScreenGui:Destroy()
end)
SettingsTab:AddSeparator()
SettingsTab:AddSection("Info")
SettingsTab:AddLabel("Toggle UI: RightShift")
SettingsTab:AddLabel("Drag the top bar to move.")
SettingsTab:AddLabel("Made By CozzyBruh")

-- STARTUP
task.wait(0.5)
Notify("Auto Answer", "Loaded — Made By CozzyBruh", 4, "success")
