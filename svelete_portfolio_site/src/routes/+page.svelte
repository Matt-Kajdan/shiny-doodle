<script>
    import Card from '../lib/components/Card.svelte';
</script>

<style>
    .grid-container {
        display: grid;
        grid-template-columns: repeat(1);
        gap: 4rem;
        width: 100%;
    }

    #intro {
        margin-bottom: 7rem;
        text-align: center;
    }

    @media (min-width: 1280px) {
        .grid-container {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        }
    }
</style>

<head>
    <title>Portfolio</title>
</head>

<main>
    <h1 id="intro">Design portfolio</h1>
    <div class="grid-container">
        <Card 
            title="Smart Print"
            navigate="./smart-print"
            image="./work/smart-print/card.png"
        />
        <Card 
            title="Skarsken & König"
            navigate="./skarsken-konig"
            image="./work/skarsken-konig/card.png"
        />
        <Card 
            title="Festivio"
            navigate="./festivio"
            image="./work/festivio/card.png"
        />
        <Card 
            title="Vault"
            navigate="./vault"
            image="./work/vault/card.png"
        />
        <Card 
            title="Global Comms"
            navigate="./global-comms"
            image="./work/global-comms/card.png"
        />
        <Card 
            title="Habits"
            navigate="./habits"
            image="./work/habits/card.png"
        />
        <Card 
            title="Globetrotter"
            navigate="./globetrotter"
            image="./work/globetrotter/card.png"
        />
        <Card 
            title="Axe & Sword"
            navigate="./axe-sword"
            image="./work/axe-sword/card.png"
        />
    </div>
</main>
