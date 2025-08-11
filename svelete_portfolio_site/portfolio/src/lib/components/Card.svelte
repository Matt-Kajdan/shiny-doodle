<script lang=ts>
    export let title = '';
    export let navigate = '';
    export let image = '';
</script>

<style>
    .card {
        aspect-ratio: 5/4;
        background-color: #ddd;
        background-size: cover;
        background-position: center;
        border-radius: 2rem;
        box-shadow: var(--def-shadow);
        transition: box-shadow 0.1s linear, background-size 0.2s ease-in-out;
        background-size: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        color: #333;
        text-align: center;
    }

    .card:hover {
        cursor: pointer;
        box-shadow: var(--hov-shadow);
        background-size: 101%;
    }

    .title {
        position: absolute;
        font-size: 1.5rem;
        font-weight: bold;
        visibility: hidden;
    }

    .card.has-image .title {
        visibility: hidden;
    }

    .card.no-image .title {
        visibility: visible;
    }

    .card a {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 100%;
    }
</style>

<div class="card {image ? 'has-image' : 'no-image'}" style="background-image: url('{image}');">
    <a href={navigate}>
        <span class="title">{title}</span>
    </a>
</div>
